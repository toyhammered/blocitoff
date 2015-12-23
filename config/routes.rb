Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy, :update]
  end
  
  authenticated :user do
    root to: "users#show"
  end
  
  unauthenticated :user do 
    root to: 'home#index', as: :unauth_root
  end

end
