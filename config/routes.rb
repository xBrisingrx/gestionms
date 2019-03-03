Rails.application.routes.draw do
  root 'clients#index'
  
  resources :clients do
  	resources :people
  end

  post 'disabled_client', to: 'clients#disabled', as: 'disabled_client'
  get 'clients/:client_id/people/:id/disable', to: 'people#disable'

  resources :users
  get 'users/:id/disable', to: 'users#disable'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :tickets do
    resources :answers
    member do
      get '/tickets/close_ticket', to: 'tickets#close_ticket', as: 'close_ticket'
    end
  end

end
