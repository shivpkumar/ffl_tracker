class ApplicationController < ActionController::Base
  protect_from_forgery

  def create_session(admin)
    session[:admin_id] = admin.id
  end

  def current_user
    if session[:admin_id]
      @current_user = Admin.find(session[:admin_id])
    end
  end

  helper_method :current_user
end
