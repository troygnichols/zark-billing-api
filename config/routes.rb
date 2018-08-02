Rails.application.routes.draw do
  resources :items, defaults: { format: 'json' }

  resources :invoices, except: [:new, :edit], defaults: { format: 'json' }

  get 'profile', to: 'profile#show'
  match 'profile', to: 'profile#update', via: [:put, :patch]

  match 'update_password', to: 'password#update', via: [:put, :patch]

  post 'signup', to: 'signup#create'
  get 'signup/activate', to: 'signup#activate'

  post 'authenticate', to: 'authentication#authenticate'
end
