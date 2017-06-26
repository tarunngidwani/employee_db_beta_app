class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :create

  def create
    user = User.find_or_create_by(:provider => auth_hash[:provider], :uid => auth_hash[:uid]) do |user|
      user.name = auth_hash[:info][:name]
    end

    session[:user_id] = user.id

    redirect_to :employees
  end

  def destroy
  end

  private
  def auth_hash
    request.env["omniauth.auth"]
  end

end
