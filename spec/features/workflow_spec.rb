
require 'rails_helper'

RSpec.describe "Full Workflow Integration", type: :feature do
  let!(:cliente) { Usuario.create(nome: "Cliente Teste", email: "cliente@test.com", password: "123456", role: "cliente") }
  let!(:cuidador) { Usuario.create(nome: "Cuidador Teste", email: "cuidador@test.com", password: "123456", role: "cuidador", especializacoes: ['enfermagem'], disponibilidade: '08:00-12:00', regioes_atendimento: ['Lisboa']) }
  let!(:servico) { Servico.create(nome: "Serviço Teste", preco: 100.0) }

  it "allows a cliente to create a solicitation and process a payment" do
    # Login as cliente
    visit new_usuario_session_path
    fill_in "Email", with: "cliente@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"

    # Create a solicitation
    visit new_solicitation_path
    select "Serviço Teste", from: "Serviço"
    fill_in "Observações", with: "Preciso de assistência urgente."
    click_button "Enviar Solicitação"

    expect(page).to have_content("Solicitação enviada com sucesso.")

    # Log out cliente and log in as admin to approve solicitation
    click_link "Sair"
    admin = Usuario.create(nome: "Admin", email: "admin@test.com", password: "123456", role: "admin")
    visit new_usuario_session_path
    fill_in "Email", with: "admin@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"

    visit solicitations_path
    click_button "Aprovar"

    expect(page).to have_content("Status atualizado com sucesso.")

    # Log out admin and log in as cliente to pay
    click_link "Sair"
    visit new_usuario_session_path
    fill_in "Email", with: "cliente@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"

    visit new_solicitation_payment_path(Solicitation.last)
    fill_in "Valor", with: "100.0"
    select "Cartão de Crédito", from: "Método de Pagamento"
    click_button "Realizar Pagamento"

    expect(page).to have_content("Pagamento realizado com sucesso!")
  end
end
