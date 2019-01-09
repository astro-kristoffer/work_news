Rails.application.routes.draw do
  get 'home/index'
  devise_for :admins
  get 'persons/profile'

  resources :articles do
    resources :comments
  end

  root 'home#index'
  get 'persons/profile', as: 'user_root'

end
