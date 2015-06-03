class WelcomeController < ApplicationController

  # most of the time respond with normal index page, but sometimes
  # break, this will allow aws to think the instance is not healthy
  def index
    error = false
    #TODO:create in predictable safe place
    if File.exists?('http_fail_next')
      File.delete('http_fail_next')
      error = true
    end
    if Random.rand(100) > 90
      File.open('http_fail_next','w+') do |f|
      f.write('.')
      error = true
        end
    end
   respond_to do |format|
    if error
       format.html { render status: 503 }
       format.json { render status: 503 }
      else
        format.html { render }
        format.json { head :no_content}
     end
    end
  end

end
