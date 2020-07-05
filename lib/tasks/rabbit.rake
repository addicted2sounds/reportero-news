namespace :rabbit do
  desc 'Setup routing'
  task setup: :environment do
    connection = Bunny.new(ENV['RABBITMQ_URL']).tap do |c|
      c.start
    end
    channel = connection.create_channel
    exchange = channel.fanout ENV['TASKS_QUEUE'], durable: true
    queue = channel.queue ENV['TASKS_QUEUE'], durable: true
    queue.bind exchange

    connection.close
  end
end
