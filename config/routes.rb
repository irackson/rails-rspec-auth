Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root 'home#homepage'
  get 'homepage', to: 'home#homepage'
  get 'posts', to: 'posts#index'
end
