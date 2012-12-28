class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def authenticate_admin!
    authenticate_user! 
    redirect_to root_path unless current_user.admin?
  end
  
  private

  def set_locale
    I18n.locale = params[:locale] || :ru
  end

  def default_url_options
    I18n.locale == :en ? { locale: I18n.locale } : {}
  end
end
