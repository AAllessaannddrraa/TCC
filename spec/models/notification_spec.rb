
require 'rails_helper'

RSpec.describe Notification, type: :model do
  it "é válido com mensagem e status" do
    notification = FactoryBot.build(:notification)
    expect(notification).to be_valid
  end

  it "é inválido sem mensagem" do
    notification = FactoryBot.build(:notification, message: nil)
    expect(notification).to_not be_valid
  end

  it "é inválido com status fora dos permitidos" do
    notification = FactoryBot.build(:notification, status: "invalido")
    expect(notification).to_not be_valid
  end
end
