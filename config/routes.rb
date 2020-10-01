Rails.application.routes.draw do

  root "visitors#index"
  ###########Administrate gem routes#########
  namespace :administrator do
    resources :admins
    resources :users

    root to: "admins#index"
  end

  ###########################################
  #########Devise routes#####################

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_scope :admin do
    get '/admins/sign_out' => 'admins/sessions#destroy'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
  end
  ############################################
  ##########API Routes########################
  namespace :api, defaults: { format: 'json' } do
    mount_devise_token_auth_for 'User', at: 'v1/auth'
  end
  ############################################
end
