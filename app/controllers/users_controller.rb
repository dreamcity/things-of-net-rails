class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit,:update,:destroy]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 1)
  end

  def show
    @user = User.find(params[:id])
    @sensors = @user.sensors.paginate(page: params[:page], :per_page => 5)
  end
  def edit
    # @user= User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to root_path
  end
  def update
    @user= User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
       render 'edit'
	end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Ipv6&Rails"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def correct_user
    	@user=User.find(params[:id])  
    	redirect_to(root_path) unless current_user?(@user)
    end
end 