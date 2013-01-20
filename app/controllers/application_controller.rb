class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user


  def user_should_be_login
    redirect_to "/login" unless current_user
  end

  protected
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end
