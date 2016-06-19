class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    @user = User.where(username: params[:username]).first
    if @user
      session[:user_id] = @user.id
      redirect_to root_url
    else
      session[:user_id] = nil
      render :new
    end
  end

  def destroy
    logout
  end
end
