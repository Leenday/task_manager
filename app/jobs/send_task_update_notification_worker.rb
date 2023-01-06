class SendTaskUpdateNotificationWorker < ApplicationWorker
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer

  def perform(task_id)
    task = Task.find_by(id: task_id)
    return if task.blank?

    UserMailer.with(user: task.author, task: task).task_updated.deliver_now
  end
end
