
require 'rails_helper'

RSpec.describe Servico, type: :model do
  context 'validations' do
    it 'is valid with valid attributes' do
      usuario = Usuario.create(nome: 'Test User', email: 'test@example.com', password: 'password123')
      servico = Servico.new(nome: 'Test Service', descricao: 'Test Description', preco: 100.0, data_agendamento: Time.now, cliente: usuario)
      expect(servico).to be_valid
    end

    it 'is invalid without a nome' do
      servico = Servico.new(descricao: 'Test Description', preco: 100.0, data_agendamento: Time.now)
      expect(servico).not_to be_valid
    end

    it 'is invalid with a negative preco' do
      servico = Servico.new(nome: 'Test Service', descricao: 'Test Description', preco: -10.0, data_agendamento: Time.now)
      expect(servico).not_to be_valid
    end
  end
end
