Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :transactions, only: [] do
      collection do
        post :execute
        get :history
      end
    end
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/auth/registrations'
    }
  end

end
