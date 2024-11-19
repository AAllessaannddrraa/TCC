# spec/controllers/servicos_controller_spec.rb
require 'rails_helper'

RSpec.describe ServicosController, type: :controller do
  let(:cliente) { Usuario.create(nome: 'Cliente Teste', email: 'cliente@teste.com', password: 'senha123', role: :cliente) }
  let(:cuidador) { Usuario.create(nome: 'Cuidador Teste', email: 'cuidador@teste.com', password: 'senha123', role: :cuidador) }
  let(:servico) { Servico.create(descricao: 'Cuidar de paciente', data_hora: DateTime.now, usuario: cliente) }

  before do
    allow(controller).to receive(:current_usuario).and_return(cliente)
  end

  describe 'GET #editar' do
    it 'permite acesso ao cliente dono do serviço' do
      get :editar, params: { id: servico.id }
      expect(response).to be_successful
    end

    it 'bloqueia acesso a outros usuários' do
      allow(controller).to receive(:current_usuario).and_return(cuidador)
      get :editar, params: { id: servico.id }
      expect(response).to redirect_to(servicos_path)
      expect(flash[:alert]).to eq('Você não tem permissão para realizar esta ação.')
    end
  end
end
