class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def logged_in_user
  end

  def current_user
    @current_user = session['current_user']
  end

  def logged_in?
  end
end
