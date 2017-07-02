module OmniauthLoginTestHelper
  private

  def login(provider, user_name)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = create_omniauth_mock_auth_hash provider, user_name

    get omniauth_callback_url(provider)
  end

  def create_omniauth_mock_auth_hash(provider, user_name)
    OmniAuth::AuthHash.new(provider: provider, uid: 12_345,
                           info: { name: user_name })
  end
end
