Rails.application.routes.draw do
  root 'sessions#login'

  get 'auth/github', as: 'github_auth'
  get 'auth/:provider/callback', to: 'sessions#create'

  get 'sessions/destroy', as: 'logout'

  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  resources :employees
end
