Rails.application.routes.draw do
  root 'home#index'

  get '/apoiar_system', to: 'seu_controlador#sua_acao' # Substitua 'seu_controlador' e 'sua_acao' pelos nomes apropriados

  resources :pacientes
  resources :cuidadores
  resources :turnos
  resources :feedbacks
  resources :sessoes, only: %i[new create destroy]
  resources :usuarios

  get 'login', to: 'sessoes#new'
  post 'login', to: 'sessoes#create'
  delete 'logout', to: 'sessoes#destroy'
end
