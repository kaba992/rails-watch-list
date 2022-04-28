Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :movies, only: %i[show]
  resources :lists do
    resources :bookmarks do
    end
  end
end
