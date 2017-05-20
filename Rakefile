# Rakefile
require File.expand_path(File.dirname(__FILE__) + "/boot.rb")
require "sinatra/activerecord/rake"

namespace :sidekiq do
  desc "start sidekiq"
  task :start do
    puts "start sidekiq cron"
    system("RACK_ENV=#{ENV['RACK_ENV']} bundle exec sidekiq -C #{APP_ROOT}/config/sidekiq-cron.yml -d")
  end

  task :restart => [:stop, :start] do
  end

  task :stop do
    puts "stop sidekiq cron"
    system("bundle exec sidekiqctl stop #{APP_ROOT}/tmp/pids/sidekiq-cron.pid")
  end
end
