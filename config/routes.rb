Rails.application.routes.draw do
  root 'tickets#index'
  
  resources :clients do
  	resources :people
    resources :fleets
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
    
    resources :ticket_answers
    # member do
    #   post '/tickets/close_ticket', to: 'tickets#close_ticket', as: 'close_ticket'
    # end
  end

  get 'tickets/get_tickets/:ticket_status_id', to: 'tickets#get_tickets', as: 'get_tickets'
  get 'count_tickets', to: 'tickets#count_tickets', as: 'count_tickets'
  get 'get_fleet/:client_id/:fleet_type_id', to: 'fleets#get_fleet', as: 'get_fleet'
  post 'assign_person', to: 'tickets#assign_person', as: 'assign_person'
  post 'close_ticket', to: 'tickets#close_ticket', as: 'close_ticket'

  # Reports
  resources :reports, only: [:index]
  get 'report_between_dates/:start_date/:end_date', to: 'reports#report_between_dates', as: 'report_between_dates', defaults: { format: 'xlsx' }

end
