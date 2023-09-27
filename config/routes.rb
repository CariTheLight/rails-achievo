Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :goals, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create, :edit, :update]
  end
  resources :tasks, only: :destroy
end
