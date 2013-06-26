class ApplicationController < ActionController::Base
  protect_from_forgery

  def create_session(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  helper_method :current_user
end
