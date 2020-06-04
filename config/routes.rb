Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'status#index'
  post '/session', to: 'session#create'
  get 'users/current', to: 'users#show_current'

  resources :leads
  resources :notes
  resources :users, only: [:create]
  resources :enrichments, only: [:create]
end
