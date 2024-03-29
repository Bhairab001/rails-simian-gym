class Task < ActiveRecord::Base
  attr_reader :start_time, :end_time

  def work
    @not_working = true
    self.pid=Process.spawn("yes")
    self.save
    Thread.new do
      @start_time = Time.new
      #TODO: log this time both to the app log and the appropriate model for UI display
      @end_time = @start_time+1
      while completion < 99
        sleep(3)
        #TODO: kill the yes command after completion
      end
      #TODO: make duration customizable
    end
    @not_working = false
  end

  def completion
    return 0 if @end_time.nil?
    current_time = Time.new
    total = @end_time - @start_time
    left = @end_time - current_time < 0 ? 0 : @end_time - current_time
    100-(left/total)*100
  end

end
