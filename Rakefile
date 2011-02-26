module DotfilesHelpers
  def link_file from, to
    dest = File.expand_path to
    if File.exists? dest
      puts "File #{dest} already exists" # TODO add overwrite logic by user request
    else
      ln_s File.expand_path("../#{from}", __FILE__), dest
    end
  end

  def source to, path
    dest = File.expand_path to

    file dest => "sources" do
      if path =~ /git$/
        sh "git clone #{path} #{to}"
        Dir.chdir dest do
          sh "git submodule init"
        end
      end
    end

    task :pull => dest do
      if path =~ /git$/
        Dir.chdir dest do
          sh "git pull"
          sh "git submodule update"
        end
      end
    end.
    invoke
  end

  directory "sources"
  def install source, cmd = nil
    dir = File.expand_path source
    Dir.chdir dir do
      if cmd
        sh cmd
      elsif File.exists?("Rakefile") and `rake -T` =~ /^rake install/
        sh "rake install"
      elsif File.exists?("install.sh")
        sh "install.sh"
      else
        raise ArgumentError, "Can not detect installation script in #{dir}"
      end
    end
  end

  def dotfile_task(name, &block)
    raise ArgumentError, "Block is not provided in #{name} task" unless block_given?

    namespace name do
      task :install do
        yield if block_given?
      end
    end

    desc "Install #{name} files"
    task name do
      puts "*** Installing #{name}"
      Rake::Task["#{name}:install"].invoke
    end
    task :default => name
  end
end

include DotfilesHelpers

task :default

dotfile_task :vim do
  source "sources/vim", "git://github.com/nikitug/janus.git"
  install "sources/vim", "rake link_vimrc"
  link_file "vimrc", "~/tmp/.vimrc.local"
  link_file "gvimrc", "~/tmp/.gvimrc.local"
end

dotfile_task :bash do
  source "sources/bash", "git://github.com/nikitug/bash-settings.git"
  bashrc_line = ". #{File.expand_path("sources/bash/auto.sh")}" # TODO add install to bash-settings
  unless `cat ~/.bashrc` =~ /#{bashrc_line}/
    sh "echo \"#{bashrc_line}\" >> ~/.bashrc"
  end
end

dotfile_task :byobu do link_file "byobu", "~/.byobu" end
dotfile_task :git   do link_file "gitconfig", "~/.gitconfig" end
dotfile_task :mc    do link_file "mc", "~/.mc" end

