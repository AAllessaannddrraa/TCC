Rails.application.routes.draw do
  root 'pages#home'

  devise_for :usuarios

  devise_scope :usuario do
    get '/login', to: 'devise/sessions#new'
  end

  # Rota para "/adm"
  get '/adm', to: redirect('/admin/dashboard')

  # Namespace for administrative actions
  namespace :admin do
    resources :usuarios, only: [:index, :show, :destroy]
    resources :reports, only: [:index, :show]
    get 'dashboard', to: 'dashboard#index'
    resources :cuidadores, only: [:index]
  end

  namespace :rh do
    resources :cuidadores, only: [:index, :update]
  end

  namespace :supervisora do
    resources :apoios, only: [:index, :update]
  end

  resources :servicos, only: [:index, :show, :create, :update]
  resources :usuarios, only: [:show, :update]
  resources :clientes
  resources :pacientes
  resources :turnos
  resources :feedbacks
  resources :pagamentos
end
