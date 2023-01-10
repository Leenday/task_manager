class ApplicationWorker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker
end
