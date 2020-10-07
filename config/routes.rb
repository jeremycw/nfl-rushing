Rails.application.routes.draw do
  root 'rushes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rushes, only: [:index]
end
