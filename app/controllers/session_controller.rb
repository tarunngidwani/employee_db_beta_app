class SessionController < ApplicationController

  def login; end

  def create
    session['current_user'] = create_current_user_info_hash

    respond_to do |format|
      format.html { redirect_to employees_url }
    end
  end

  private

    def create_current_user_info_hash
      github_auth_hash = request.env['omniauth.auth']
      user_uid = github_auth_hash['uid']
      user_name = github_auth_hash['info']['name']

      current_user = {
        uid: user_uid,
        name: user_name
      }
end
