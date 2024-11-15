# app/models/turno.rb
class Turno < ApplicationRecord
  belongs_to :cuidador
  belongs_to :paciente

  validates :data, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fim, presence: true

  # Example method for creating fake Turno data for testing
  def self.create_fake_turnos(count = 10)
    count.times do
      Turno.create(
        data: Faker::Date.between(from: 2.days.ago, to: Date.today),
        hora_inicio: "#{rand(0..23)}:#{rand(0..59)}",
        hora_fim: "#{rand(0..23)}:#{rand(0..59)}",
        cuidador_id: Cuidador.pluck(:id).sample,
        paciente_id: Paciente.pluck(:id).sample
      )
    end
  end
end
