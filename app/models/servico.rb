class Servico < ApplicationRecord
  # Associações
  belongs_to :cliente, class_name: 'Usuario'
  belongs_to :cuidador

  # Enum para status
  enum status: {
    pendente: 0,
    confirmado: 1,
    concluido: 2,
    cancelado: 3
  }

  # Validações
  validates :nome, :descricao, :preco, :data_agendamento, :status, presence: true
  validates :preco, numericality: { greater_than_or_equal_to: 0 }

  # Métodos personalizados

  # Retorna se o serviço pode ser alterado ou está bloqueado (finalizado ou cancelado)
  def editavel?
    pendente? || agendado? || em_andamento?
  end

  # Retorna se o serviço foi finalizado
  def finalizado?
    concluido? || cancelado?
  end

  # Métodos auxiliares
  def status_humanizado
    Servico.statuses.key(status).humanize
  end
end
