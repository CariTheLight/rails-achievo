Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :goals, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create, :edit, :update, :destory]
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
#   get 'journals/index'
#   get 'journals/show'
#   get 'journals/new'
#   get 'journals/create'
#   get 'journals/edit'
#   get 'journals/update'
#   get 'journals/destroy'
end
