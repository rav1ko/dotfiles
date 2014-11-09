require 'rake'
require 'fileutils'
require File.join(File.dirname(__FILE__), 'lib', 'vundle')

task :default => :install

desc "Installs dotfiles"
task :install => [:submodules_init, :submodules] do

  install_rvm_binstubs

  puts
  puts "======================================================"
  puts "                symlinking files."
  puts "======================================================"
  puts
  file_operation(Dir.glob('git/*'))
  file_operation(Dir.glob('ctags/*'))
  file_operation(Dir.glob('tmux/*'))
  file_operation(Dir.glob('xorg/*'))
  file_operation(Dir.glob('{vim,vimrc}'))

  Rake::Task["vundle"].execute

  install_prezto

  run_bundle_config

end

task :submodules_init do
  run %{git submodule update --init --recursive}
end

desc "Init and update submodules"
task :submodules do
  puts "======================================================"
  puts "Downloading submodules...please wait"
  puts "======================================================"

  run %{
    cd $HOME/.dotfiles
    git submodule update --recursive
    git clean -df
  }

  puts
end

desc "Runs Vundle updater/installer"
task :vundle do
  puts "======================================================"
  puts "Installing and updating vundles."
  puts "======================================================"
  puts ""

  vundle_path = File.join('vim','bundle', 'vundle')
  unless File.exists?(vundle_path)
    run %{
      cd $HOME/.dotfiles
      git clone https://github.com/gmarik/vundle.git #{vundle_path}
    }
  end

  Vundle::update_vundle
end

private

def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def install_prezto
  unless Dir.exists?("#{ENV['HOME']}/.zprezto")
    run %{ git clone --recursive https://github.com/rav1ko/prezto.git "${ZDOTDIR:-$HOME}"/.zprezto }
  end

  run %{
    cd "${ZDOTDIR:-$HOME}"/.zprezto
    git submodule update --init --recursive
  }

  file_operation(Dir.glob("#{ENV['HOME']}/.zprezto/runcoms/z*"), method = :copy)
end

def file_operation(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    if f[0] == "/"
      source = f
    else
      source = "#{ENV['PWD']}/#{file}"
    end
    target = "#{ENV["HOME"]}/.#{file}"

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end

    # Temporary solution until we find a way to allow customization
    # This modifies zshrc to load all  zsh extensions.
    if file == 'zshrc'
      File.open(target, 'a') do |zshrc|
        zshrc.puts('for config_file ($HOME/.dotfiles/zsh/*.zsh) source $config_file')
      end
    end

    puts "=========================================================="
    puts
  end
end

def number_of_cores
  cores = run %{ nproc }
  puts
  cores.to_i
end

def run_bundle_config
  return unless system("which bundle")

  bundler_jobs = number_of_cores - 1
  puts "======================================================"
  puts "Configuring Bundlers for parallel gem installation"
  puts "======================================================"
  run %{ bundle config --global jobs #{bundler_jobs} }
  puts
end

def install_rvm_binstubs
  puts "======================================================"
  puts "Installing RVM Bundler support."
  puts "======================================================"
  run %{ chmod +x $rvm_path/hooks/after_cd_bundler }
  puts
end
