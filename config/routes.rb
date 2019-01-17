Rails.application.routes.draw do
  
  get 'search', to: 'search#search'
  get 'admin', to: 'admin#index'
  devise_for :admins
  
  resources :articles do
    resources :images
  end
  root 'articles#index'
end
