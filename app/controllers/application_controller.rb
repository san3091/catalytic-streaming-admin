class ApplicationController < ActionController::Base

  helper_method :current_admin
  helper_method :admin_logged_in?
  helper_method :authorized

  def current_admin
    Admin.find_by(id: session[:admin_id])
  end

  def admin_logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/login' unless admin_logged_in?
  end
end
