Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'movies#index'
  resources :movies
  resources :lists, only: %i[show index new] do
    resources :bookmark, only: %i[new] do
    end
  end
end
