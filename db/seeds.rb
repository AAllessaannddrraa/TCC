# db/seeds.rb
Usuario.find_or_create_by!(
  email: 'admin@example.com'
) do |user|
  user.nome = 'Admin'
  user.password = 'senha123'
  user.password_confirmation = 'senha123'
  user.papel = 'administrador'
end

Usuario.find_or_create_by!(
  email: 'cliente@example.com'
) do |user|
  user.nome = 'Cliente Exemplo'
  user.password = 'senha123'
  user.password_confirmation = 'senha123'
  user.papel = 'cliente'
end

Usuario.find_or_create_by!(
  email: 'cuidador@example.com'
) do |user|
  user.nome = 'Cuidador Exemplo'
  user.password = 'senha123'
  user.password_confirmation = 'senha123'
  user.papel = 'cuidador'
end

puts 'Usuários criados com sucesso!'

require 'faker'

Cuidador.create_fake_cuidadores(10)
