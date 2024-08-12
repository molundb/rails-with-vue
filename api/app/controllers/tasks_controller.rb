class TasksController < ApplicationController
  before_action :set_post, only: %i[destroy complete]

  def index
  end

  def create
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
