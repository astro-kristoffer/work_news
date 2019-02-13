Rails.application.routes.draw do
  devise_for :admins
  
  resources :articles do
    resources :images
  end
  root 'articles#index'
end
