class Feedback < ApplicationRecord
  belongs_to :paciente
  belongs_to :cuidador

  validates :nivel_satisfacao, presence: true
end
