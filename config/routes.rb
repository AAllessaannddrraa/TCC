Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :usuarios

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

  # Root route
  root to: 'home#index'
end
