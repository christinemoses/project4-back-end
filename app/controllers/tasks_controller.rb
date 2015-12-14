class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy, :show]


  # GET /events/1/tasks
  def index
    @tasks = current_user.events.find(params[:event_id]).tasks

    render json: @tasks
  end

  # GET /events/1/tasks/1
  def show
    render json: @task
  end

  # POST /events/1/tasks
  def create
    @task = current_user.events.find(params[:event_id]).tasks.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH /events/1/tasks/1
  def update
    if @task.update(task_params)
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1/tasks/1
  def destroy
    @task.destroy

    head :no_content
  end

  def set_task
    @task = current_user.events.find(params[:event_id]).tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :date)
  end

  private :set_task, :task_params
end
