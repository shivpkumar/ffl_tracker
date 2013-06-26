class AdminsController < ApplicationController
  
  def index
    @admins = Admin.all
    # only visible to master admin (ME!)
    # how to create master admin session to have access to all pages on site?
  end

  def new
    @admin = Admin.new
    # link to from 'create new league' button on homepage
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      create_session(@admin)
      redirect_to admin_path(@admin)
    else
      flash.now[:errors] = @admin.remove_sensitive_error_messages
      render :new
    end
  end

  def show
    @admin = Admin.find(params[:id])
    # page to show all current leagues for a particular admin
    # also include link to create a new league
    # sessions enabled so page is only visible to that admin
    # if anyone but that admin tries to view this page, redirect to root
  end

  def edit
    @admin = Admin.find(params[:id])
    # form to edit admin settings
    # could eventually include email notification settings
    # sessions enabled so page is only visible to that admin
    # if anyone but that admin tries to view this page, redirect to root
  end

  def update
    @admin = Admin.find(session[:admin_id])
    @admin.assign_attributes(params[:admin])
    if @admin.save
      redirect_to admin_path(@admin)
    else
      flash.now[:errors] = @admin.remove_sensitive_error_messages
      render :edit
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
  end
end
