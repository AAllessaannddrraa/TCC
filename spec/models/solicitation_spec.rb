
require 'rails_helper'

RSpec.describe Solicitation, type: :model do
  it "é válido com cliente, serviço e status" do
    solicitation = FactoryBot.build(:solicitation)
    expect(solicitation).to be_valid
  end

  it "é inválido sem cliente" do
    solicitation = FactoryBot.build(:solicitation, cliente: nil)
    expect(solicitation).to_not be_valid
  end

  it "é inválido sem serviço" do
    solicitation = FactoryBot.build(:solicitation, servico: nil)
    expect(solicitation).to_not be_valid
  end

  it "é inválido com status fora dos permitidos" do
    solicitation = FactoryBot.build(:solicitation, status: "desconhecido")
    expect(solicitation).to_not be_valid
  end
end
