Rails.application.routes.draw do

  resources :tweet_templates
  resource :hardware, only: [:edit, :update], controller: :hardware
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

  resource :starters, only: [:edit, :update, :show] do
    post :stop
  end
  root 'home#index'

  post '/reboot', to: "pi#reboot"
  post '/shut_down', to: "pi#shut_down"
  post '/update', to: "pi#update"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
