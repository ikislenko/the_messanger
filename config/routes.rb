Rails.application.routes.draw do
  resources :posts
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  resources :posts do
    resources :comments, except: [:index, :new, :show] do
        member do
          get :reply
        end
      end
  end

  root to: "home#show"
end
