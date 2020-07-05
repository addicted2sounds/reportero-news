require 'sneakers'

Sneakers.configure(
  workers: ENV.fetch('SNEAKERS_WORKERS', 10).to_i,
  prefetch: ENV.fetch('SNEAKERS_THREADS', 10).to_i,
  threads: ENV.fetch('SNEAKERS_PREFETCH', 10).to_i
)

Sneakers.logger.level = Logger::INFO # the default DEBUG is too noisy
Sneakers.logger = Rails.logger
Sneakers::Worker.logger = Rails.logger