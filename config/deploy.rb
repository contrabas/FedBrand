require 'bundler/capistrano'

server '178.63.96.144', :app, :web, :db, primary: true

set :user, 'fedbrand'
set :deploy_to, '/var/rails/fedbrand'

set :use_sudo, false
set :deploy_via, :remote_cache

set :scm, :git
set :repository, 'git@github.com:RavWar/FedBrand.git'
set :normalize_asset_timestamps, false
set :shared_children, shared_children + %w[public/uploads]

ssh_options[:forward_agent] = true

namespace :deploy do
  task(:start) {}
  task(:stop)  {}

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end