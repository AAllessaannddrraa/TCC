
require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  let(:usuario) { FactoryBot.create(:usuario) }
  let(:notification) { FactoryBot.create(:notification, usuario: usuario) }

  before { sign_in usuario }

  describe "GET #index" do
    it "retorna sucesso para o cliente logado" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "atualiza o status da notificação para 'read'" do
      patch :update, params: { id: notification.id, status: "read" }
      expect(notification.reload.status).to eq("read")
    end
  end

  describe "DELETE #destroy" do
    it "remove a notificação" do
      delete :destroy, params: { id: notification.id }
      expect(Notification.exists?(notification.id)).to be_falsey
    end
  end
end
