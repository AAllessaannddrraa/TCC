class Servico < ApplicationRecord
  belongs_to :cliente, class_name: 'Usuario'
  belongs_to :cuidador, class_name: 'Usuario'

  validates :data, presence: true
  validates :hora, presence: true
end
class Servico < ApplicationRecord
  # Associations
  belongs_to :cliente, class_name: "Usuario"

  # Validations
  validates :nome, :descricao, :preco, :data_agendamento, presence: true
  validates :preco, numericality: { greater_than_or_equal_to: 0 }

  # Status options
  STATUS = %w[pendente confirmado cancelado]

  validates :status, inclusion: { in: STATUS }
end
