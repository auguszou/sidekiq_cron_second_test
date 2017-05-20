class ScheduleJob
  include Sidekiq::Worker
  sidekiq_options queue: "schedule_cron", retry: false

  def perform(*args)
    Sidekiq.logger.info "ScheduleJob.perform, args:#{args}"
  end
end
