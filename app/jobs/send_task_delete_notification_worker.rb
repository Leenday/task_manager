class SendTaskDeleteNotificationWorker < ApplicationWorker
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer

  def perform(task_id)
    task = Task.find_by(id: task_id)
    return if task.blank?

    UserMailer.with(user: task.author, task: task).task_deleted.deliver_now
  end
end
