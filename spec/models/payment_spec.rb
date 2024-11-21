
require 'rails_helper'

RSpec.describe Payment, type: :model do
  it "é válido com valor, status e método de pagamento" do
    payment = FactoryBot.build(:payment)
    expect(payment).to be_valid
  end

  it "é inválido sem valor" do
    payment = FactoryBot.build(:payment, valor: nil)
    expect(payment).to_not be_valid
  end

  it "é inválido com valor negativo" do
    payment = FactoryBot.build(:payment, valor: -10)
    expect(payment).to_not be_valid
  end

  it "é inválido com status fora dos permitidos" do
    payment = FactoryBot.build(:payment, status: "invalido")
    expect(payment).to_not be_valid
  end
end
