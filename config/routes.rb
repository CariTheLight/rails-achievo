Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  post '/submit_prompt', to: 'pages#submit_prompt'
  resources :goals, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create ]
  end
  resources :tasks, only: [:destroy,:edit, :update]
end
