# Criação de usuários de exemplo
Usuario.create!(
  nome: 'Admin',
  email: 'admin@example.com',
  password: 'senha123',
  password_confirmation: 'senha123',
  papel: 'administrador'
)

Usuario.create!(
  nome: 'Cliente Exemplo',
  email: 'cliente@example.com',
  password: 'senha123',
  password_confirmation: 'senha123',
  papel: 'cliente'
)

Usuario.create!(
  nome: 'Cuidador Exemplo',
  email: 'cuidador@example.com',
  password: 'senha123',
  password_confirmation: 'senha123',
  papel: 'cuidador'
)

puts 'Usuários criados com sucesso!'
