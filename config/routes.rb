Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  resources :users, only: [:show] do
    resources :items, only: [:create, :destroy, :update]
  end

  resources :items, only: [] do
    put '/try-again' => 'items#try_again', as: :try_again
  end

end
