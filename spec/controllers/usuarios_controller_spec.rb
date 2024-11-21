
require 'rails_helper'

RSpec.describe UsuariosController, type: :controller do
  let(:usuario) { FactoryBot.create(:usuario) }

  describe "GET #new" do
    it "retorna sucesso" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "com parâmetros válidos" do
      it "cria um novo usuário" do
        expect {
          post :create, params: { usuario: { nome: "Teste", email: "teste@example.com", password: "password123" } }
        }.to change(Usuario, :count).by(1)
      end
    end

    context "com parâmetros inválidos" do
      it "não cria um novo usuário" do
        expect {
          post :create, params: { usuario: { nome: "", email: "", password: "" } }
        }.to_not change(Usuario, :count)
      end
    end
  end
end
