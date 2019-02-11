Rails.application.routes.draw do

  resource :hardware, only: [:edit, :update], controller: :hardware
  resource :secret, only: [:edit, :update], controller: :secret
  resource :reset, only: [:edit, :update], controller: :reset do
    post :start
  end
  resource :fossil, only: [:edit, :update, :show] do
    post :stop
  end

  resource :alolan, only: [:edit, :update, :show] do
    post :stop
  end
  root 'home#index'

  post '/reboot', to: "pi#reboot"
  post '/shut_down', to: "pi#shut_down"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
