# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

set :application, "sistemaspa"
set :repo_url, "https://github.com/neuronadev/sistemaspa.git"
set :branch, "interfaz_1"
#set :repo_url, "file:///home/developer/desarrollos/estudiantes"
#set :ssh_options, { :forward_agent => true }
set :deploy_to, "/home/deploy/apps/sistemaspa"
set :pg_without_sudo, false

set :pg_host, 'localhost'
set :pg_database, 'spa'
set :pg_username, 'appsie'
set :pg_ask_for_password, true
set :pg_encoding, 'UTF-8'
set :pg_pool, '100'

#set :rvm_type, :system
set :rvm_ruby_version, 'ruby-2.6.3'



append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

#before "deploy:assets:precompile", "deploy:yarn_install"

#namespace :deploy do
#  desc 'Run rake yarn:install'
#  task :yarn_install do
#    on roles(:web) do
#      within release_path do
#        execute("cd #{release_path} && yarn install")
#      end
#    end
#  end
#end

#set :linked_dirs, fetch(:linked_dirs, []).push('public/packs', 'node_modules')
#Cargar base de datos
#task "deploy:db:load" do
#    on primary :db do
#      within release_path do
#        with rails_env: fetch(:rails_env) do
#          execute :rake, "db:schema:load"
#        end
#      end
#    end
#  end
#  before "deploy:migrate", "deploy:db:load"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

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
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
#set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }
