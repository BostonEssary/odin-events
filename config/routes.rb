Rails.application.routes.draw do
  devise_for :users
  resources :users

  resources :events do
    member do
      get 'attend'
      get 'unattend'
    end
  end

  get '/profile', to: 'users#profile'
  get '/notcreator', to: 'events#notcreator'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
end
