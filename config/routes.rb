Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:index,:edit, :update,:show]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end
  resources :tweets, only: [:index, :new, :create]
  resources :events
  resources :picts, only: [:new,:index,:create,:show]
end
