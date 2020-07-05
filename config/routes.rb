Rails.application.routes.draw do
  root 'tasks#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
