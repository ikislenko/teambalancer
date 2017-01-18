class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :json
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    render json: @tasks.to_json
  end


  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.create(task_params)

    render json: @task.to_json
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :story_points, :user_id)
    end
end
