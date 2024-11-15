Rails.application.routes.draw do
    root to: "articles#index"
    resources :articles, except: :index

    resources :pacientes
  resources :cuidadores
  resources :turnos
  resources :feedbacks
  resources :sessoes, only: %i[new create destroy]
  resources :usuarios

  get '/apoiar_system', to: 'home#index'
  get 'login', to: 'sessoes#new'
  post 'login', to: 'sessoes#create'
  delete 'logout', to: 'sessoes#destroy'
  end
