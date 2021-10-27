# config valid for current version and patch releases of Capistrano
lock '~> 3.16.0'

set :application, 'port-share'
set :repo_url, 'https://github.com/TetsuyaAzami/port-share'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/port-share'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
append :linked_files, 'config/master.key', '.env', 'config/database.yml'
append :linked_dirs, '.bundle', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix,
    "RBENV_ROOT=#{fetch(:rbenv_path)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :puma_daemonize, false

namespace :"webpack" do
  desc 'bin/webpack'
  task :build do
    on roles(:web) do
      within "#{current_path}" do
        execute :'bundle', 'exec', 'bin/webpack'
      end
    end
  end
end
after 'deploy:finishing', 'webpack:build'
