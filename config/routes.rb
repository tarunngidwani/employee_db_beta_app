Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html

  root 'employees#index', as: 'employees'

  resources :employees
end
