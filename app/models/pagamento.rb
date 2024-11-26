class Pagamento < ApplicationRecord
  belongs_to :cliente, class_name: "Usuario"
  belongs_to :servico

  validates :valor, presence: true, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: %w[pendente concluido cancelado] }

  enum status: {
    pendente: 0,
    concluido: 1,
    cancelado: 2
  }
end
