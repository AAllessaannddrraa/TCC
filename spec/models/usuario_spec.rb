
require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it "é válido com nome, email e senha" do
    usuario = FactoryBot.build(:usuario)
    expect(usuario).to be_valid
  end

  it "é inválido sem nome" do
    usuario = FactoryBot.build(:usuario, nome: nil)
    expect(usuario).to_not be_valid
  end

  it "é inválido sem email" do
    usuario = FactoryBot.build(:usuario, email: nil)
    expect(usuario).to_not be_valid
  end

  it "é inválido sem senha" do
    usuario = FactoryBot.build(:usuario, password: nil)
    expect(usuario).to_not be_valid
  end

  it "é inválido com email duplicado" do
    FactoryBot.create(:usuario, email: "usuario@example.com")
    usuario = FactoryBot.build(:usuario, email: "usuario@example.com")
    expect(usuario).to_not be_valid
  end
end
