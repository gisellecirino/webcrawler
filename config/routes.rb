require 'sidekiq/web'

Rails.application.routes.draw do
  resources :auths, only: [:create]
  
  root 'quotes#index'
  mount Sidekiq::Web => '/sidekiq'
  get 'quotes/:search', to: 'quotes#search_tag'
end
