Rails.application.routes.draw do
  get 'pi/reboot'
  get 'pi/shut_down'
  resource :fossil, only: [:edit, :update, :show] do
    post :stop
  end
  root 'home#index'

  post '/reboot', to: "pi#reboot"
  post '/shut_down', to: "pi#shut_down"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
