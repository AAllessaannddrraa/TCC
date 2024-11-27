Rails.application.routes.draw do
  # Rota principal
  root 'pages#home'

  # Devise
  devise_for :usuarios, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }

  # Rota para "/adm"
  get '/adm', to: redirect('/admin/dashboard')

  # Namespaces
  namespace :admin do
    resources :usuarios, only: [:index, :show, :destroy]
    resources :reports, only: [:index, :show]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :rh do
    resources :cuidadores, only: [:index, :update]
  end

  namespace :supervisora do
    resources :apoios, only: [:index, :update]
  end

  # Recursos Globais
  resources :cuidadores, only: [:index, :show]
  resources :servicos
  resources :usuarios
  resources :clientes
  resources :pacientes
  resources :turnos
  resources :feedbacks
  resources :pagamentos

  # Rota para 404
  match '*unmatched', to: 'application#not_found', via: :all
end
