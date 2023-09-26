Rails.application.routes.draw do
  get 'journals/index'
  get 'journals/show'
  get 'journals/new'
  get 'journals/create'
  get 'journals/edit'
  get 'journals/update'
  get 'journals/destroy'
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/edit'
  get 'tasks/update'
  get 'tasks/destroy'
  get 'goals/index'
  get 'goals/show'
  get 'goals/new'
  get 'goals/create'
  get 'goals/edit'
  get 'goals/update'
  get 'goals/destroy'
  devise_for :users
  root to: "pages#home"
  post '/submit_prompt', to: 'pages#submit_prompt'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
