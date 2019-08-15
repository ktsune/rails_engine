Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/most_revenue', to: 'revenue#show'
        get '/revenue', to: 'revenue#index'
        get '/most_items', to: 'items#index'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
    end
  end
end
