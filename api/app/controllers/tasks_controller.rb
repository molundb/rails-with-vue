class TasksController < ApplicationController
  before_action :set_post, only: %i[destroy complete]

  def index
    render json: {
      tasks: Task.all
    }, status: :ok
  end

  def create
    task = Task.new(task_params)
    
    if task.save
      render json: {
        task: task
      }, status: :created
    else
      render json: {
        messages: task.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    render json: {
      messages: ["Task destroyed successfully"]
    }, status: :ok
  end

  def complete
    if @task.update(completed: true)
      render json: {
        task: @task
      }, status: :ok
    else
      render json: {
        messages: @task.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
