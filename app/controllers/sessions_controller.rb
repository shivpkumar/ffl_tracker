class SessionsController < ApplicationController
  
  def new
  end

  def create
  	@admin = Admin.find_by_email(params[:session][:email])
  	if @admin && @admin.authenticate(params[:session][:password])
  		create_session(@admin)
  		redirect_to admin_path(@admin)
  	else
  		flash.now[:errors] = ['Invalid email/password combination']
  		render :new
  	end
  end

  def destroy
  	session.clear
  	redirect_to root_path
  end
end