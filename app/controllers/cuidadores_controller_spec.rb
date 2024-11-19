# spec/controllers/cuidadores_controller_spec.rb
require 'rails_helper'

RSpec.describe CuidadoresController, type: :controller do
  let(:cuidador) { Cuidador.create(nome: 'Cuidador Teste', numero_contato: '123456789', email: 'cuidador@teste.com') }

  describe 'GET #index' do
    it 'retorna sucesso' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'retorna sucesso' do
      get :show, params: { id: cuidador.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'cria um novo cuidador com dados válidos' do
      expect {
        post :create, params: { cuidador: { nome: 'Novo Cuidador', numero_contato: '987654321', email: 'novo@cuidador.com' } }
      }.to change(Cuidador, :count).by(1)
      expect(response).to redirect_to(cuidadores_path)
      expect(flash[:notice]).to eq('Cuidador criado com sucesso. Aguarde a validação do administrador.')
    end
  end

  describe 'PATCH #update' do
    it 'atualiza o perfil do cuidador com dados válidos' do
      patch :update, params: { id: cuidador.id, cuidador: { nome: 'Nome Atualizado' } }
      cuidador.reload
      expect(cuidador.nome).to eq('Nome Atualizado')
      expect(response).to redirect_to(cuidador)
      expect(flash[:notice]).to eq('Perfil atualizado com sucesso. Aguardando validação do administrador.')
    end

    it 'não atualiza com dados inválidos' do
      patch :update, params: { id: cuidador.id, cuidador: { nome: '' } }
      expect(response).to render_template(:edit)
      expect(flash[:alert]).to eq('Erro ao atualizar o perfil.')
    end
  end

  describe 'DELETE #destroy' do
    it 'remove o cuidador' do
      expect {
        delete :destroy, params: { id: cuidador.id }
      }.to change(Cuidador, :count).by(-1)
      expect(response).to redirect_to(cuidadores_path)
      expect(flash[:notice]).to eq('Cuidador removido com sucesso.')
    end
  end
end
