class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    user = GardenFacade.find_user(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to root_path, flash: { alert: 'You must be logged in' } unless current_user
  end
end
