Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/:id/revenue', to: 'single_merchant_revenue#show'
        get '/:id/revenue', to: 'single_merchant_revenue#show'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/most_revenue', to: 'revenue#show'
        get '/revenue', to: 'revenue#index'
        get '/most_items', to: 'items#index'
        get '/:id/favorite_customer', to: 'items#show'
        get '/:id/items', to: 'one_merchant_items#show'
        get '/:id/invoices', to: 'one_merchant_invoices#show'
      end

      namespace :transactions do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id/invoice', to: 'invoice#show'
      end

      namespace :customers do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
        get '/:id/transactions', to: 'customer_relations#index'
        get '/:id/invoices', to: 'customer_relations#show'
      end

      namespace :invoices do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :invoice_items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end

      namespace :items do
        get '/most_revenue', to: 'all_items#index'
        get '/most_items', to: 'all_items#show'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:id/best_day', to: 'best_day#show'
      end

      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
end
