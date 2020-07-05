module Tasks
  class FetchUrlsTask < Task
    after_create_commit :run_job

    private

    def run_job
      FetchUrlsJob.perform_later id, user.email
    end
  end
end
