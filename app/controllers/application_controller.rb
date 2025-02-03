class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to root_path, alert: "You are not logged in" unless logged_in?
  end

  private

  def record_not_found(err)
    redirect_to root_path, alert: "#{err.model} record could not be found"
  end
end
