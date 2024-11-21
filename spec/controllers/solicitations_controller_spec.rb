
require 'rails_helper'

RSpec.describe SolicitationsController, type: :controller do
  let(:usuario) { FactoryBot.create(:usuario, role: "admin") }
  let(:solicitation) { FactoryBot.create(:solicitation) }

  before { sign_in usuario }

  describe "GET #index" do
    it "retorna sucesso" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "atualiza o status da solicitação" do
      patch :update, params: { id: solicitation.id, status: "aprovado" }
      expect(solicitation.reload.status).to eq("aprovado")
    end
  end
end
