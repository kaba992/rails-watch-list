Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'movies#index'
  resources :lists,  except: [:edit, :update]  do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: :destroy
  resources :movies
end
