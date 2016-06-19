class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :authorize

  protected

  # Private: Ensures User is logged in.
  def authorize
    if current_user.nil?
      redirect_to login_path
    end
  end

  # Private: Returns the current logged in User.
  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end
  helper_method :current_user
  
  private
    def logout
      session[:user_id] = nil
      redirect_to login_path
    end
    
    def record_not_found
      render file: Rails.root.join('public/404.html'), status: 404
    end
end
