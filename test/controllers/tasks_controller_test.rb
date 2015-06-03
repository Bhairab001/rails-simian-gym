require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  #of course this is not the standard rails RESTful way but helps
  #this app be easy to automate and stress with curl get requests
  test "should get new" do
    assert_difference('Task.count') do
      get :new
    end
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { name: @task.name }
    end

    # deliberately wrong expectation so rake/Jenkins can throw an error as
    # result of controller tests not passing.
    # assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { name: @task.name }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
