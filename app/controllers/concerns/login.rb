module Login
  private

  def user_logged_in
    return if session['VALID_LOGIN']

    respond_to do |format|
      format.html { redirect_to login_url, notice: 'Please login before you proceed' }
    end
  end
end