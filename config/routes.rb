Rails.application.routes.draw do
  resources :items, defaults: { format: 'json' }

  resources :invoices, except: [:new, :edit], defaults: { format: 'json' }

  get 'profile', to: 'profile#show'
  match 'profile', to: 'profile#update', via: [:put, :patch]

  match 'update_password', to: 'password#update', via: [:put, :patch]

  post 'authenticate', to: 'authentication#authenticate'

  match '(*path)', to: 'application#cors_preflight', via: :options
end
