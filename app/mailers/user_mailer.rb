class UserMailer < ApplicationMailer
  def task_created
    user = params[:user]
    @task = params[:task]

    mail(from: 'noreply@taskmanager.com', to: user.email, subject: 'New Task Created')
  end

  def task_updated
    @task = params[:task]
    author = @task.author

    mail(from: 'noreply@taskmanager.com', to: author.email, subject: 'Task Updated')
  end

  def task_deleted
    @task = params[:task]
    author = @task.author

    mail(from: 'noreply@taskmanager.com', to: author.email, subject: 'Task Deleted')
  end

  def reset_password
    @user = params[:user]
    @token = params[:token]

    mail(from: 'noreply@taskmanager.com', to: @user.email, subject: 'Password Reset')
  end
end
