class WelcomeController < ApplicationController
  def home
  	@sensor = current_user.sensors.build if signed_in?
  end

  def help
  end

  def about
  end
	
  def contact
  end
end
