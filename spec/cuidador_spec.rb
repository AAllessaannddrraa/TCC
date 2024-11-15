require 'rails_helper'

RSpec.describe Cuidador, type: :model do
  context 'validações' do
    it 'é válido com nome e número de contato' do
      cuidador = Cuidador.new(nome: 'Teste Cuidador', numero_contato: '123456789')
      expect(cuidador).to be_valid
    end

    it 'é inválido sem um nome' do
      cuidador = Cuidador.new(numero_contato: '123456789')
      expect(cuidador).not_to be_valid
    end

    it 'é inválido sem um número de contato' do
      cuidador = Cuidador.new(nome: 'Teste Cuidador')
      expect(cuidador).not_to be_valid
    end
  end
end
