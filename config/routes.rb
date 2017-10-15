# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  # bills endpoints
  resources :bills do
    # people who exist on a bill, and their endpoints
    resources :billeds
  end

  # auth endpoint
  post 'auth/login', to: 'authentication#authenticate'

  # create new user
  post 'signup', to: 'users#create'
end
