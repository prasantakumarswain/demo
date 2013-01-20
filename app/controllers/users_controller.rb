class UsersController < ApplicationController
	def all_user
		@users = User.all
	end

	def new_user
		@user = User.new
	end

	def create_new_user
		@user = User.new(params[:user])
		if @user.save
      UserMailer.welcome_mail(@user).deliver
      UserSession.find().destroy
			redirect_to root_path
		else
			render :new_user
		end
	end

	def show_user
		@user = User.find(params[:id])
	end

	def edit_user
		@user = User.find(params[:id])		
	end

	def user_update
		@user =User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to show_user_user_path(@user)
		else
			render :edit_user
		end
	end

	def delete_user
		@user = User.find(params[:id])
		if @user.delete 
			redirect_to all_user_users_path
		else
			render :all_user
		end
		
	end
end
