Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    resources :pokemon, only: [:index, :create, :update] 

    resources :pokemon, only: [:show] do 
      resources :items, only: [:index]
    end

  



  end
end
