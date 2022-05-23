
Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'movies#index'
  resources :lists, except: [:edit, :update]
  resources :movies, only: [:show, :index] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy
end
