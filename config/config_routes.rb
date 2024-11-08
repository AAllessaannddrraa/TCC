Rails.application.routes.draw do
  root 'usuarios#index'
  get 'login', to: 'sessoes#new'
  post 'login', to: 'sessoes#create'
  delete 'logout', to: 'sessoes#destroy'
  resources :usuarios
end
