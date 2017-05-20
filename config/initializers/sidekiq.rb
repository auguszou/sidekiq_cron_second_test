redis_url = YAML.load(ERB.new(File.read(File.join('config', 'redis.yml'))).result)["test"]['url']

Sidekiq.configure_server do |config|
  config.redis = { :url => redis_url, :namespace => 'sidekiq', network_timeout: 5, pool_timeout: 5, size: 25 }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => redis_url, :namespace => 'sidekiq', network_timeout: 5, pool_timeout: 5, size: 25 }
end

# sidekiq cron
cron_file = "config/schedule.yml"
if File.exists?(cron_file) && Sidekiq.server?
  Sidekiq.options[:poll_interval] = 5
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(cron_file)
end
