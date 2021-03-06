Rails.application.routes.draw do
  resources :items, defaults: { format: 'json' }

  resources :invoices, except: [:new, :edit], defaults: { format: 'json' }

  get 'profile', to: 'profile#show'
  match 'profile', to: 'profile#update', via: [:put, :patch]

  match 'update_password', to: 'password#update', via: [:put, :patch]
  post 'send_password_reset', to: 'password#send_reset'
  get 'reset_password', to: 'password#forward_link'
  match 'reset_password', to: 'password#reset', via: [:put, :patch]

  post 'signup', to: 'signup#create'
  get 'signup/activate', to: 'signup#activate'

  post 'authenticate', to: 'authentication#authenticate'
end
