Rails.application.routes.draw do

  get '/api/transactions/history/:id' => 'api/transactions#history'

  namespace :api, defaults: { format: :json } do
    resources :transactions, only: [] do
      # get '/history/:id', to: 'transactions#history'
      collection do
        post :execute
        # get :history
      end
    end
    resources :wallets, only: [] do
      member do
        get :show
      end
    end
    resources :users, only: [] do
      collection do
        get :index
      end
    end
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/auth/registrations'
    }
  end

end
