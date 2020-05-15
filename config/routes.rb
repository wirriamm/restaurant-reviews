Rails.application.routes.draw do
  resources :restaurants do
    collection do
      get :top
    end

    member do
      get :chef
    end

    resources :reviews, only: [:new, :create]
  end
  # outside restaurants, deleting review has nothing to do with the restaurant instance
  resources :reviews, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
