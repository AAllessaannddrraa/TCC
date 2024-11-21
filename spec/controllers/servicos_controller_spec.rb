
require 'rails_helper'

RSpec.describe ServicosController, type: :controller do
  let(:usuario) { Usuario.create(nome: 'Test User', email: 'test@example.com', password: 'password123') }
  let(:valid_attributes) { { nome: 'Test Service', descricao: 'Test Description', preco: 100.0, data_agendamento: Time.now, cliente_id: usuario.id } }
  let(:invalid_attributes) { { nome: '', descricao: 'Test Description', preco: -10.0, data_agendamento: Time.now, cliente_id: usuario.id } }

  before do
    sign_in usuario
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new Servico' do
        expect {
          post :create, params: { servico: valid_attributes }
        }.to change(Servico, :count).by(1)
      end

      it 'redirects to the servicos path' do
        post :create, params: { servico: valid_attributes }
        expect(response).to redirect_to(servicos_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new Servico' do
        expect {
          post :create, params: { servico: invalid_attributes }
        }.not_to change(Servico, :count)
      end

      it 'renders the new template' do
        post :create, params: { servico: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
