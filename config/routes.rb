Rails.application.routes.draw do
  
  get 'search', to: 'search#search'
  devise_for :admins
  
  resources :articles do
    resources :images
  end
  root 'articles#index'
end
