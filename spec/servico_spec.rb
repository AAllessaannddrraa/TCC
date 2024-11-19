# spec/models/servico_spec.rb
require 'rails_helper'

RSpec.describe Servico, type: :model do
  it 'é válido com descrição e data/hora' do
    servico = Servico.new(descricao: 'Cuidar do paciente X', data_hora: DateTime.now)
    expect(servico).to be_valid
  end

  it 'é inválido sem descrição' do
    servico = Servico.new(data_hora: DateTime.now)
    expect(servico).not_to be_valid
  end

  it 'é inválido sem data/hora' do
    servico = Servico.new(descricao: 'Cuidar do paciente Y')
    expect(servico).not_to be_valid
  end
end
