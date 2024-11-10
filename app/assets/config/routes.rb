Rails.application.routes.draw do
  # Defina o root do sistema para o index geral
  root 'home#index'

  # Rotas para Cuidadores
  resources :cuidadores

  # Rotas para Pacientes
  resources :pacientes

  # Rotas para Usuários
  resources :usuarios

  # Rotas para Feedbacks
  resources :feedbacks

  # Rotas para Turnos
  resources :turnos

  # Rotas para Sessões (login/logout)
  get 'login', to: 'sessoes#new'    # Página de login
  post 'login', to: 'sessoes#create' # Ação de criação de sessão (login)
  delete 'logout', to: 'sessoes#destroy' # Ação de logout

  # Definindo a rota raiz (ajuste conforme necessário)
  root 'sessoes#new'
end
