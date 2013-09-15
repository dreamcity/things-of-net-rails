class SensorsController < ApplicationController
	# before_action :signed_in_user
  def create
    @user = user.find(params[:user_id])
    @sensor = @user.sensors.create(params[:sensor].permit(:sen_name, :sen_data))
    redirect_to user_path(@user)
  end



 # 	def create
	#     @sensor = current_user.sensors.build(sensor_params)
	#     if @sensor.save
	#       flash[:success] = "add a new sensor!"
	#       redirect_to root_url
	#     else
	#       render 'static_pages/home'
	#     end
	# end

	def destroy
	end

	  private

	    def sensor_params
	      params.require(:sensor).permit(:sen_name, :sen_data)
	    end

end
