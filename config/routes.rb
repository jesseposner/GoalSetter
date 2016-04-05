Rails.application.routes.draw do
  resources :users, only: [:create, :new, :index, :show]
  resources :goals, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
end
