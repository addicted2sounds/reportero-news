class FetchUrlsJob < ApplicationJob
  queue_as :default
 
  def perform(task_id, email)
    task = Task.find task_id
    task.running!
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
    task.completed!
  end
end
