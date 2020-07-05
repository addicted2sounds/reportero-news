module Tasks
  class FetchUrlsTask < Task
    after_create_commit :run_job
    CATEGORIES = [
      ['Daily top 100', 'top100_today'],
      ['Weekly top 100', 'top100_week'],
      ['Montly top 100', 'top_100']
    ].freeze
    
    private

    def run_job
      FetchUrlsJob.perform_later id
    end
  end
end
