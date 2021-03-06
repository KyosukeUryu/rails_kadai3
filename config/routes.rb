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
      get :favor_pictures
    end
  end

  resources :sessions, only: %i[new create destroy]

  resources :favorites, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
