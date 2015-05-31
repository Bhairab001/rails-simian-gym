class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :work]

  # GET /tasks/1/work
  # TODO: GET /tasks/1/work.json
  def work
    @task.work
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task spawned pid #{@task.pid}." }
      format.json { head :no_content }
    end
  end


  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @task.name = "#{MacAddress.address}"
    #fully aware that this is not a very RESTful way of doing this
    #but ease of automation and scripting for this app makes this an adequate way
    @task.work if params[:auto_start]
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task succesfully created'}
        format.json { head :no_content }
      else
        #TODO better error message
        format.html { redirect_to tasks_url, notice: 'Cannot create task' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name).permit(:auto_start)
    end
end
