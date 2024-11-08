class Turno < ApplicationRecord
  belongs_to :cuidador
  belongs_to :paciente

  validates :data, presence: true
  validates :hora_inicio, presence: true
  validates :hora_fim, presence: true
end
