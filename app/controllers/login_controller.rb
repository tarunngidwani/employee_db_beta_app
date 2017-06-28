class LoginController < ApplicationController

  def login; end

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
end
