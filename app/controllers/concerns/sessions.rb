module Sessions
  extend ActiveSupport::Concern

  private

  def check_user_logged_in
    return if user_logged_in?

    respond_to do |format|
      format.html { redirect_to login_url, notice: 'Please login before proceeding' }
    end
  end

  def current_user
    session['current_user']
  end

  def current_user=(current_user_hash)
    session['current_user'] = current_user_hash
  end

  def user_logged_in?
    current_user ? true : false
  end

  def current_user_name
    current_user['name']
  end
end
