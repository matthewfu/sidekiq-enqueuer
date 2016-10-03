ENV['RACK_ENV'] = 'test' # skip Rack Protection

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/unit'
require 'minitest/pride'
require 'mocha/test_unit'

require 'rack/test'

require 'active_job'

require 'sidekiq'
require 'sidekiq/api'
require 'sidekiq/enqueuer'
require 'support/test_job_models'

Sidekiq.logger.level = Logger::ERROR
REDIS = Sidekiq::RedisConnection.create(url: 'redis://localhost/15')

#ActiveJob::Base.queue_adapter = :sidekiq
ActiveJob::Base.logger.level = Logger::ERROR

