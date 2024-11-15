# app/models/paciente.rb
class Paciente < ApplicationRecord
  has_many :turnos
  has_many :feedbacks

  validates :nome, presence: true
  validates :numero_contato, presence: true

  # Example method for creating fake Paciente data for testing
  def self.create_fake_pacientes(count = 10)
    count.times do
      Paciente.create(
        nome: Faker::Name.name,
        numero_contato: Faker::PhoneNumber.cell_phone
      )
    end
  end
end
