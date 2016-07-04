class UsersController < ApplicationController
	before_action :set_user, except: [:index, :new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:success] = "User has been created"
			redirect_to @user
		else
			flash[:danger] = "User could not be saved"
			render :new
		end
	end

	def show
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

end