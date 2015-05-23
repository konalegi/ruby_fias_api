# config valid only for Capistrano 3.1
lock '3.4.0'
application = 'ruby_fias_api'
set :application, application
#set :repo_url, 'git@git_repo'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deployer/apps/' + application
# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{ config/puma.rb }

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets public/uploads tmp/fias tmp/eye}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Eyehome variable
set :eye_home, "#{fetch(:deploy_to)}/tmp"

namespace :deploy do

  task :stop do
    on roles(:app) do
      within release_path do
        execute :bundle, "exec leye --eyehome '#{fetch(:eye_home)}' stop all"
        execute :bundle, "exec leye --eyehome '#{fetch(:eye_home)}' quit"
      end
    end
  end

  task :info do
    on roles(:app) do
      within release_path do
        execute :bundle, "exec leye --eyehome '#{fetch(:eye_home)}' info"
      end
    end
  end

  task :start do
    on roles(:app) do
      within release_path do
        execute :bundle, "exec leye --eyehome '#{fetch(:eye_home)}' load"
      end
    end
  end

  task :restart do
    invoke 'deploy:stop'
    invoke 'deploy:start'
  end

end

# after 'deploy:publishing', 'deploy:restart'

# namespace :deploy do
#   task :restart do
#     invoke 'unicorn:restart'
#   end
# end
