# config/routes.rb
Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles, except: :index

  resources :pacientes
  resources :cuidadores
  resources :turnos
  resources :feedbacks

  resources :usuarios do
    member do
      patch :confirmar
    end
  end

  resources :sessoes, only: %i[new create destroy]
  resources :servicos do
    member do
      patch :confirmar
      patch :rejeitar
    end
  end

  # Rotas personalizadas para login e logout - Certifique-se de que não são duplicadas
  get 'login', to: 'sessoes#new', as: :login
  post 'login', to: 'sessoes#create'
  delete 'logout', to: 'sessoes#destroy', as: :logout
end
