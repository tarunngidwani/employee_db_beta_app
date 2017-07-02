module OmniauthLoginTestHelper
  private

  def create_omniauth_mock_auth_hash(provider, user_name)
    OmniAuth::AuthHash.new(provider: provider, uid: 12_345,
                           info: { name: user_name })
  end
end
