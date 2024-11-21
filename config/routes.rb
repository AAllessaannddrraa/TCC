Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   # Root route
  root to: "pages#home"

  devise_for :usuarios

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Usuarios routes
  resources :usuarios, only: [:new, :create, :edit, :update, :destroy] do
    collection do
      get :recover_password
    end
  end

  # Solicitations routes
  resources :solicitations, only: [:index, :show, :update]

  # Payments routes
  resources :payments, only: [:index, :show, :new, :create, :destroy]

  # Notifications routes
  resources :notifications, only: [:index, :update, :destroy]

  # Cuidadores routes
  resources :cuidadores

  # Pacientes routes
  resources :pacientes

  # Turnos routes
  resources :turnos

  # Dashboard routes
  get 'dashboard/admin_dashboard', to: 'dashboard#admin_dashboard'

end
