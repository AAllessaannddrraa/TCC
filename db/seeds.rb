# db/seeds.rb
# Criação de usuários de exemplo
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

# Criação de serviços de exemplo
Servico.find_or_create_by!(
  nome: 'Serviço 1'
) do |servico|
  servico.descricao = 'Descrição do Serviço 1'
  servico.preco = 100.0
end

Servico.find_or_create_by!(
  nome: 'Serviço 2'
) do |servico|
  servico.descricao = 'Descrição do Serviço 2'
  servico.preco = 200.0
end

# Criação de clientes de exemplo
Cliente.find_or_create_by!(
  email: 'cliente1@example.com'
) do |cliente|
  cliente.nome = 'Cliente 1'
  cliente.telefone = '123456789'
end

Cliente.find_or_create_by!(
  email: 'cliente2@example.com'
) do |cliente|
  cliente.nome = 'Cliente 2'
  cliente.telefone = '987654321'
end

# Criação de pacientes de exemplo
Paciente.find_or_create_by!(
  nome: 'Paciente 1'
) do |paciente|
  paciente.idade = 30
  paciente.endereco = 'Endereço do Paciente 1'
  paciente.condicoes = 'Condição 1'
  paciente.estado_saude = 'bom'
end

Paciente.find_or_create_by!(
  nome: 'Paciente 2'
) do |paciente|
  paciente.idade = 40
  paciente.endereco = 'Endereço do Paciente 2'
  paciente.condicoes = 'Condição 2'
  paciente.estado_saude = 'regular'
end

# Criação de turnos de exemplo
Turno.find_or_create_by!(
  data_inicio: DateTime.now,
  data_fim: DateTime.now + 1.hour,
  status: 'ativo',
  cuidador_id: Cuidador.first.id,
  paciente_id: Paciente.first.id
)

Turno.find_or_create_by!(
  data_inicio: DateTime.now,
  data_fim: DateTime.now + 2.hours,
  status: 'inativo',
  cuidador_id: Cuidador.last.id,
  paciente_id: Paciente.last.id
)

# Criação de feedbacks de exemplo
Feedback.find_or_create_by!(
  comentario: 'Ótimo serviço!',
  avaliacao: 5,
  usuario_id: Usuario.first.id,
  servico_id: Servico.first.id
)

Feedback.find_or_create_by!(
  comentario: 'Serviço razoável.',
  avaliacao: 3,
  usuario_id: Usuario.last.id,
  servico_id: Servico.last.id
)

# Criação de pagamentos de exemplo
Pagamento.find_or_create_by!(
  valor: 150.0,
  data: Date.today,
  cliente_id: Cliente.first.id,
  servico_id: Servico.first.id
)

Pagamento.find_or_create_by!(
  valor: 250.0,
  data: Date.today,
  cliente_id: Cliente.last.id,
  servico_id: Servico.last.id
)

puts 'Usuários criados com sucesso!'

require 'faker'

Cuidador.create_fake_cuidadores(10)
