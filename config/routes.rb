Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  root 'login#login', as: 'login'

  get '/auth/github', as: 'github_login'
  get '/auth/:provider/callback', to: 'login#authenticate', as: 'omniauth_callback'

  resources :employees
end
