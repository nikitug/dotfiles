require 'rake'
require 'erb'

module DotfilesHelpers
  def generate to, source, bnd = nil
    if source =~ /\.erb$/
      puts "Generating #{source}"
      File.open File.expand_path(to), "w" do |file|
        file.write ERB.new(File.read source).result(bnd)
      end
    else
      raise ArgumentError, "Only *.erb files supported"
    end
  end

  def link_file from, to
    dest = File.expand_path to
    if File.exists? dest
      if ENV["rewrite"] == "true"
        sh "rm -rf #{dest}"
      else
        puts "File #{dest} already exists"
        return
      end
    end
    ln_s File.expand_path("../#{from}", __FILE__), dest
  end

  def source to, path
    dest = File.expand_path to
    namespace dest do
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
      end
    end
    Rake::Task["#{dest}:pull"].invoke
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

desc "Pull the latest"
task :pull do
  sh "git pull"
end

desc "Update repo"
task :update => [:pull, :default]

dotfile_task :bash do
  source "sources/bash", "git://github.com/nikitug/bash-settings.git"
  link_file "sources/bash", "~/.bash"
  bashrc_line = ". #{File.expand_path("sources/bash/auto.sh")}" # TODO add install.sh to bash-settings
  unless `cat ~/.bashrc` =~ /#{bashrc_line}/
    sh "echo \"#{bashrc_line}\" >> ~/.bashrc"
  end
end

dotfile_task :vim do
  source "sources/vim", "git://github.com/nikitug/janus.git"
  link_file "sources/vim", "~/.vim"
  install "sources/vim", "rake"
  link_file "vimrc", "~/.vimrc.local"
  link_file "gvimrc", "~/.gvimrc.local"
end

dotfile_task :git do
  gitconfig = File.expand_path "~/.gitconfig"
  if File.exists? gitconfig
    if m = /\[github\]\s+user\s*=\s*(?<name>[a-z0-9_-]+)\s+token\s*=\s*(?<token>[a-z0-9]+)/.match(`cat #{gitconfig}`)
      name = m[:name]
      token = m[:token]
    end
  end
  generate "sources/gitconfig", "gitconfig.erb", binding
  link_file "sources/gitconfig", "~/.gitconfig"
end

dotfile_task "gnome-terminal" do
  dir = File.expand_path "~/.gconf/apps/gnome-terminal/profiles/Default"
  unless File.exists? dir
    sh "mkdir -p #{dir}"
  end
  link_file "gnome-terminal", File.join(dir, "%gconf.xml")
end

%w[byobu mc].each do |file|
  dotfile_task file do
    link_file file, "~/.#{file}"
  end
end

task :server => [:bash, :vim, :git, :byobu, :mc]

