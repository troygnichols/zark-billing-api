Rails.application.routes.draw do
  resources :items, defaults: { format: 'json' }

  resources :invoices, defaults: { format: 'json' }

  match '(*path)', to: 'application#cors_preflight', via: :options
end
