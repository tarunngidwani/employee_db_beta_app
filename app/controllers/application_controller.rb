class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Sessions
  helper_method %i[user_logged_in? current_user_name]
end
