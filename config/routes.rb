Rails.application.routes.draw do
  root 'pages#home'

  devise_for :usuarios

  devise_scope :usuario do
    get '/login', to: 'devise/sessions#new'
  end

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

  # Serviços routes
  resources :servicos do
    member do
      patch :confirmar
    end
    collection do
      get :calendar_events
    end
  end

  # Sessoes routes
  resources :sessoes

  # Reports routes
  resources :reports

  # Home matches routes
  resources :home_matches

  # Dashboard routes
  get 'dashboard/admin_dashboard', to: 'dashboard#admin_dashboard', as: 'dashboard'
end
