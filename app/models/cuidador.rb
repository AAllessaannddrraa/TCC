class Cuidador < ApplicationRecord
  self.table_name = "cuidadores"

  # Enum para os estados
  enum status: { ativo: 0, inativo: 1, aprovado: 2, reprovado: 3, demitido: 4, em_pausa: 5 }

  # Associações
  has_many :servicos

  # Validações
  validates :nome, :nif, :email, :numero_contato, :status, presence: true
  validates :nif, :email, :numero_contato, uniqueness: true
end
