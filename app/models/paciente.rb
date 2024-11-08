class Paciente < ApplicationRecord
  has_many :turnos
  has_many :feedbacks

  validates :nome, presence: true
  validates :numero_contato, presence: true
end
