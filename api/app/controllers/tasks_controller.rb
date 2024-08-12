class TasksController < ApplicationController
  before_action :set_post, only: %i[destroy complete]

  def index
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
  end

  def complete
  end

  private

  def set_post
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
