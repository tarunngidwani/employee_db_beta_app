module Sessions
  extend ActiveSupport::Concern

  private

  def current_user
    session['current_user']
  end

  def user_logged_in?
    current_user ? true : false
  end
end
