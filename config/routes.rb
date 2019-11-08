Rails.application.routes.draw do
  root to: 'users#tops'

  resources :users, except: %i[index destroy] do
    collection do
      get :tops
    end
  end

  resources :pictures do
    collection do
      post :confirm
    end
  end
end
