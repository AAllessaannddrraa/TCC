
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :authenticate_usuario!

    def test_redirect
      render plain: "Success"
    end
  end

  let(:admin) { Usuario.create(nome: "Admin Teste", email: "admin@test.com", password: "123456", role: "admin") }
  let(:cuidador) { Usuario.create(nome: "Cuidador Teste", email: "cuidador@test.com", password: "123456", role: "cuidador") }
  let(:cliente) { Usuario.create(nome: "Cliente Teste", email: "cliente@test.com", password: "123456", role: "cliente") }

  before do
    routes.draw { get "test_redirect" => "anonymous#test_redirect" }
  end

  it "redirects admin to admin dashboard" do
    sign_in admin
    expect(controller.after_sign_in_path_for(admin)).to eq(admin_dashboard_path)
  end

  it "redirects cuidador to caregiver dashboard" do
    sign_in cuidador
    expect(controller.after_sign_in_path_for(cuidador)).to eq(caregiver_dashboard_path)
  end

  it "redirects cliente to client dashboard" do
    sign_in cliente
    expect(controller.after_sign_in_path_for(cliente)).to eq(client_dashboard_path)
  end

  it "redirects others to root path" do
    usuario = Usuario.create(nome: "Outro", email: "outro@test.com", password: "123456", role: "other")
    sign_in usuario
    expect(controller.after_sign_in_path_for(usuario)).to eq(root_path)
  end
end
