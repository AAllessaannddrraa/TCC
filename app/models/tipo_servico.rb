class TipoServico < ApplicationRecord
  self.table_name = "tipos_servico"

  # Validações
  validates :nome, presence: true, uniqueness: true
  validates :descricao, presence: true

  # Escopo para organizar por ordem alfabética
  scope :ordenados, -> { order(nome: :asc) }
end
