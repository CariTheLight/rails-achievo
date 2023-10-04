Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  post '/submit_prompt', to: 'pages#submit_prompt'
  get '/home/random_quotes', to: 'home#random_quotes'

  resources :goals, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :journal_entries, only: [:index]
    resources :tasks, only: [:new, :create ] do
      resources :journal_entries, only: [:new, :create, :edit, :update, :destroy]
    end
    get 'journal_entries', to: 'goals#journal_entries_index'
  end

  resources :tasks, only: [:destroy,:edit, :update]
  resources :journal_entries, only: :show
end
