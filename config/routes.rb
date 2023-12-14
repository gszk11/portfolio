Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :movies, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :movie_comments, only: [:create, :destroy]
  end
end