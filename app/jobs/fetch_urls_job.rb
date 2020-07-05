class FetchUrlsJob < ApplicationJob
  SEARCH_URL = 'http://clubtone.net/'
  SONG_REGEX = %r{/music/club_music/\w+/\w+}
  queue_as :default
 
  def perform(task_id, email)
    task = Task.find task_id
    task.running!
    task.update! results: links('top100_today')
    BunnyPublisher.publish(ENV['TASKS_QUEUE'], {
      type: 'urls',
      data: {
        email: email,
        urls: task.results
      }
    })
    task.completed!
  end

  private

  def links(category)
    page = agent.get(SEARCH_URL + category)
    page.links_with(href: SONG_REGEX).map do |link|
      {
        url: link.href,
        text: link.text
      }
    end
  end

  def agent
    @agent ||= Mechanize.new
  end
end
