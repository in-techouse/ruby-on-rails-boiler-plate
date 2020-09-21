Rails.application.routes.draw do
  root "visitors#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # API Routes
  namespace :api, defaults: { format: 'json' } do
    mount_devise_token_auth_for 'User', at: 'v1/auth'
  end
end
