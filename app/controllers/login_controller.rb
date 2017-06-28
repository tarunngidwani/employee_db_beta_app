class LoginController < ApplicationController

  def authenticate
    session['VALID_LOGIN'] = true
    redirect_to employees_url
  end

  def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to login_url, notice: 'You have been logged out' }
    end
  end
end
