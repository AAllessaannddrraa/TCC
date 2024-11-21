
class Payment < ApplicationRecord
  # Associations
  belongs_to :solicitation

  # Validations
  validates :valor, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: %w[pendente pago falhou] }
end
