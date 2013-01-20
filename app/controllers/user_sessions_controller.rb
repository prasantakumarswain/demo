class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  #NOTE create user session
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path, :notice => "Successfully logged in."
    else
      render :new
    end
  end

  #NOTE Destroy user session
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    redirect_to root_url, :notice => "Successfully logged out."
  end
end
