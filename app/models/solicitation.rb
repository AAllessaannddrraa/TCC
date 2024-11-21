
class Solicitation < ApplicationRecord
  # Associations
  belongs_to :cliente, class_name: "Usuario"
  belongs_to :servico

  # Validations
  validates :status, inclusion: { in: %w[pendente aprovado rejeitado] }
end
