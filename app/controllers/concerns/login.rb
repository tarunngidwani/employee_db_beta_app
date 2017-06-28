module Login
  private

  def user_logged_in
    return unless session['current_user'].nil?

    respond_to do |format|
      format.html { redirect_to login_url, notice: 'Please login before proceeding' }
    end
  end
end
