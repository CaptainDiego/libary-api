Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'status#index'

  jsonapi_resources :leads
  jsonapi_resources :notes
  jsonapi_resources :users, only: [:create]
end
