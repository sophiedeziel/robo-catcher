Rails.application.routes.draw do
  resource :fossil, only: [:edit, :update] do
    post :stop
  end
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
