Rails.application.routes.draw do
  resources :items, defaults: { format: 'json' }

  resources :invoices, except: [:new, :edit], defaults: { format: 'json' }

  match '(*path)', to: 'application#cors_preflight', via: :options
end
