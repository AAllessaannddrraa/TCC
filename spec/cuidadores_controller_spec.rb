require 'rails_helper'

RSpec.describe CuidadoresController, type: :controller do
  describe 'GET #index' do
    it 'retorna uma resposta com sucesso' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'cria um novo cuidador' do
      expect do
        post :create, params: { cuidador: { nome: 'Novo Cuidador', numero_contato: '987654321' } }
      end.to change(Cuidador, :count).by(1)
    end

    it 'não cria um cuidador com parâmetros inválidos' do
      expect do
        post :create, params: { cuidador: { nome: '', numero_contato: '' } }
      end.not_to change(Cuidador, :count)
    end
  end
end
