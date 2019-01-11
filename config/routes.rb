Rails.application.routes.draw do
  get 'home/index'
  devise_for :admins
  resources :articles do
    resources :comments
  end
  root 'home#index'
end
