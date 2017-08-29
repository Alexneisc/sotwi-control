require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tweets#index'

  resources :tweets, only: [:index]

  # Clearance routes

  resource :session,
           controller: 'sessions',
           only: [:create]

  # Sidekiq Web

  robot_admin_constraint = Clearance::Constraints::SignedIn.new do |user|
    user.admin?
  end

  constraints robot_admin_constraint do
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
