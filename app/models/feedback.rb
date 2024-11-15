# app/models/feedback.rb
class Feedback < ApplicationRecord
  belongs_to :paciente
  belongs_to :cuidador

  validates :nivel_satisfacao, presence: true

  # Example method for creating fake Feedback data for testing
  def self.create_fake_feedbacks(count = 10)
    count.times do
      Feedback.create(
        nivel_satisfacao: rand(1..5),
        paciente_id: Paciente.pluck(:id).sample,
        cuidador_id: Cuidador.pluck(:id).sample
      )
    end
  end
end
