require 'resque'
Resque.redis = Redis.new(url: 'redis://redis:6379/0')
