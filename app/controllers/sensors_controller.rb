class SensorsController < ApplicationController
	before_action :signed_in_user  
	# before_action :correct_user,   only: :destroy
 	def create
	    @sensor = current_user.sensors.build(sensor_params)
	    if @sensor.save
	      flash[:success] = "add a new sensor!"
	      redirect_to root_url
	    else
	      render 'welcome/home'
	    end
	end

	def destroy
		@sensor = current_user.sensors.find_by(id: params[:id])
		@sensor.destroy
    	redirect_to root_url
	end

	  private

	    def sensor_params
	      params.require(:sensor).permit(:ser_name, :ser_data)
	    end

	    # def correct_user
	    #   @micropost = current_user.microposts.find_by(id: params[:id])
	    #   redirect_to root_url if @micropost.nil?
	    # end

end
