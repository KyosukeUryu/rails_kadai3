Rails.application.routes.draw do
  root to: 'users#tops'

  resources :users, except: [:index] do
    collection do
      get :tops
    end
  end
end
