Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  post '/submit_prompt', to: 'pages#submit_prompt'
  get '/home/random_quotes', to: 'home#random_quotes'
  # get 'journal_entries', to: 'goals#journal_entries_index'

  resources :goals do
    resources :journal_entries, only: [:index]
    resources :tasks, only: [:new, :create ] do
      resources :journal_entries, only: [:new, :create, :edit, :update, :delete]
    end
  end

  resources :tasks, only: [:destroy,:edit, :update] do

    resources :journal_entries, only: [:new, :create]
  end
  resources :journal_entries, only: [:show, :edit, :update, :destroy]
  end
