class UsersController < ApplicationController

	def index
		respond_to do |format|
			format.html
			format.json { render json: UsersDatatable.new(view_context) }
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :phone_number)
	end
end
