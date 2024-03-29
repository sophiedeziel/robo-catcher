Rails.application.routes.draw do
  resources :tweet_templates
  resource :hardware, only: [:edit, :update, :show], controller: :hardware
  resource :settings, only: [:edit, :update], controller: :settings
  resource :reset, only: [:edit, :update], controller: :reset do
    post :start
  end
  resource :fossil, only: [:edit, :update, :show] do
    post :stop
  end

  resource :alolan, only: [:edit, :update, :show] do
    post :stop
  end

  resource :starter, only: [:edit, :update, :show] do
    post :stop
  end

  resources :sequences do
    resources :instructions, only: [:create, :destroy]
    resources :registers, only: [:create, :update, :destroy]
    resources :pokemons, only: [:create, :edit, :update, :destroy]
    post :start
    post :stop
  end

  resources :shinies, only: [:index, :unsure] do
    post :confirm
    post :false_positive
    collection do
      get :unsure
    end
  end

  get '/stats', to: 'stats#index'
  root 'home#index'

  post '/reboot', to: "pi#reboot"
  post '/shut_down', to: "pi#shut_down"
  post '/update', to: "pi#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
