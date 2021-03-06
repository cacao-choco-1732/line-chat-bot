# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "line-chat-bot"
set :repo_url, "git@github.com:cacao-choco-1732/line-chat-bot.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/line-chat-bot"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_dirs, %w[bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets]
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :assets_roles, [:web]
set :rails_assets_groups, :assets

namespace :deploy do
  desc 'restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
after 'deploy:publishing', 'deploy:restart'
