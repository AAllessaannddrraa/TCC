# app/models/cuidador.rb
class Cuidador < ApplicationRecord
  has_many :turnos
  has_many :feedbacks

  validates :nome, presence: true
  validates :numero_contato, presence: true

  # Example method for creating fake Cuidador data for testing
  def self.create_fake_cuidadores(count = 10)
    count.times do
      Cuidador.create(
        nome: Faker::Name.name,
        numero_contato: Faker::PhoneNumber.cell_phone
      )
    end
  end
end
