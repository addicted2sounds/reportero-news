class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.order(updated_at: :desc).limit(10)
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build task_params
    if @task.save
      flash[:notice] = 'Task successfully created'
      redirect_to action: :index
    else
      flash[:error] = 'Errors with task settings'
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:type, :category, :email)
  end
end
