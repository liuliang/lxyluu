
set :application, "web"
set :repository,  "git@github.com:liuliang/lxyluu.git"
set :use_sudo, false
set :deploy_to, "/home/liuxiaoyan/#{application}"

set :scm, :git
set :user,'liuxiaoyan'
set :runuser,'liuxiaoyan'
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }

set :rails_env, "production"
set :branch, "master"

set :domain, "58.64.155.25"
role :app, domain
role :web, domain
role :db,  domain, :primary => true

task :chmod, :roles => :web do
  run "chmod -fR 755 #{deploy_to}/current/script/*"
end

after "deploy:symlink", :chmod

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end