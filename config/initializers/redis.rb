if Rails.env.production?

  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://127.0.0.1:6379/' }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://127.0.0.1:6379/' }
  end
end

if Rails.env.production?
  REDIS = Redis.new(:host => '127.0.0.1', :port => 6379)
elsif Rails.env.test?
  REDIS = MockRedis.new
else
  REDIS = Redis.new
end
