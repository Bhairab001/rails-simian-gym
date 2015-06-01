require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @task = Task.new(:name => 'test')
  end

 def test_accessor
   assert_equal @task.name,'test'
 end

  #TODO: implement completion and auto-kill of tasks
 def test_completion
#   assert_equal @task.completion,0
 #  @task.work
#   assert_not_nil @task.pid
 end

end
