class FetchUrlsJob < ApplicationJob
  def perform(email)
    urls = [
      'https://google.com',
      'https://instagram.com',
    ]
    BunnyPublisher.publish(ENV['TASKS_QUEUE'], {
      type: 'urls',
      data: {
        email: email,
        urls: urls
      }
    })
  end
end
