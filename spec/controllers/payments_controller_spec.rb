
require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let(:usuario) { FactoryBot.create(:usuario) }
  let(:solicitation) { FactoryBot.create(:solicitation, cliente: usuario) }
  let(:payment) { FactoryBot.create(:payment, solicitation: solicitation) }

  before { sign_in usuario }

  describe "GET #index" do
    it "retorna sucesso para o cliente logado" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "cria um novo pagamento com parâmetros válidos" do
      expect {
        post :create, params: { solicitation_id: solicitation.id, payment: { valor: 100.0, metodo_pagamento: "Cartão de Crédito" } }
      }.to change(Payment, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    it "permite que um administrador exclua pagamentos" do
      usuario.update(role: "admin")
      delete :destroy, params: { id: payment.id }
      expect(Payment.exists?(payment.id)).to be_falsey
    end
  end
end
