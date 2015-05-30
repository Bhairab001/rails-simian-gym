class Task < ActiveRecord::Base
  attr_reader :start_time, :end_time

  def after_create
    @start_time = 0
    @end_time = 0
  end

  def work
    @not_working = true
    Thread.new do
      @start_time = Time.new
      #TODO: log this time both to the app log and the appropriate model for UI display
      @end_time = @start_time+60
      sleep(2)
      while completion < 99
        print "completion #{completion}\n"
        sleep(2)
      end
      #TODO: make duration customizable
    end
    @not_working = false
  end

  def completion
    return 0 if @end_time.nil?
    current_time = Time.new
    total = @end_time - @start_time
    left = @end_time - current_time
    (left/total)*100
  end

end
