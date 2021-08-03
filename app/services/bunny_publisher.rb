class BunnyPublisher
  class << self
    def publish(exchange, **message)
      channel.fanout(exchange, durable: true)
            .publish(message.to_json)
    end

    private

    def channel
      @channel ||= connection.create_channel
    end

    def connection
      @connection ||= Bunny.new(ENV['RABBITMQ_URL']).tap do |c|
        c.start
      end
    end
  end
end
