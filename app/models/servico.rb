# app/models/servico.rb
class Servico < ApplicationRecord
  belongs_to :usuario
  belongs_to :cuidador, optional: true

  validates :descricao, :data_hora, presence: true

  enum status: { pendente: 0, confirmado: 1, rejeitado: 2 }
end

