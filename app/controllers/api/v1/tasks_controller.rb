class Api::V1::TasksController < Api::V1::ApplicationController
  def show
    task = Task.find(params[:id])

    respond_with(task, serializer: TaskSerializer)
  end

  def index
    tasks = Task.all
                .with_attached_image
                .ransack(ransack_params)
                .result
                .page(page)
                .per(per_page)

    respond_with(tasks, each_serializer: TaskSerializer, root: 'items', meta: build_meta(tasks))
  end

  def create
    params['task']['author_id'] = current_user.id if params.dig('task', 'author_id').nil?
    task = current_user.my_tasks.new(task_params)
    SendTaskCreateNotificationWorker.perform_async(task.id) if task.save
    respond_with(task, serializer: TaskSerializer, location: nil)
  end

  def update
    task = Task.find(params[:id])
    SendTaskUpdateNotificationWorker.perform_async(task.id) if task.update(task_params)

    respond_with(task, serializer: TaskSerializer)
  end

  def destroy
    task = Task.find(params[:id])
    SendTaskDeleteNotificationWorker.perform_async(task.id)
    task.destroy

    respond_with(task)
  end

  def attach_image
    task = Task.find(params[:id])
    attachment = params[:attachment]
    attachment_params = {
      image: attachment[:image],
      crop_x: attachment[:crop_x],
      crop_y: attachment[:crop_y],
      crop_width: attachment[:crop_width],
      crop_height: attachment[:crop_height]
    }
    task_attach_image_form = TaskAttachImageForm.new(attachment_params)

    if task_attach_image_form.invalid?
      respond_with task_attach_image_form
      return
    end

    image = task_attach_image_form.processed_image
    task.image.attach(image)

    respond_with(task, serializer: TaskSerializer)
  end

  def remove_image
    task = Task.find(params[:id])
    task.image.purge

    respond_with(task, serializer: TaskSerializer)
  end

  private

  def task_params
    params.require(:task).permit(:id, :name, :description, :author_id, :assignee_id, :state_event, :expired_at,
                                 :attachment)
  end
end
