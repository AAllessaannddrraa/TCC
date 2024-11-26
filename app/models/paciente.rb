# app/models/paciente.rb
class Paciente < ApplicationRecord
  self.table_name = "pacientes"

  # Associações
  belongs_to :cliente
  has_many :servicos
  has_many :turnos
  has_many :feedbacks

  # Validações
  validates :nome, presence: true, length: { minimum: 3 }
  validates :numero_contato, presence: true
  validates :data_nascimento, presence: true
  validates :historico_medico, presence: true
  validates :idade, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :condicoes, presence: true

  # Enum para estados
  enum status: {
    ativo: 0,
    inativo: 1
  }

  # Enumerações para estado de saúde
  enum estado_saude: {
    estavel: 0,
    critico: 1,
    recuperacao: 2
  }

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
