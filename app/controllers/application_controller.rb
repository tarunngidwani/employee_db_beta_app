class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current, :logged_in?

  def logged_in_user
    redirect_to :root unless logged_in
  end

  def current
    @current ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    !!current
  end
end
