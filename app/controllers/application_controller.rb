class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin!
    authenticate_user! 
    redirect_to root_path unless current_user.admin?
  end
end
