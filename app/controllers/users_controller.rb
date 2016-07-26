class UsersController < ApplicationController

	def index
		Rails.logger.info request.env["HTTP_COOKIE"]
  		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path, notice: "Account created."
		else
			render 'new'
		end
	end

	def show
  		@user = User.find(params[:id])
	end

	def user_events
		Event.where(user_id: self)
	end

private

	def user_params
		params.require(:user).permit(:name, :email, :password
			)
	end



end