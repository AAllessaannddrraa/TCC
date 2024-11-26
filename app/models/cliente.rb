class Cliente < ApplicationRecord
  self.table_name = "clientes"

  has_many :pacientes
  has_many :servicos
  has_many :pagamentos

  # Enumeração de status
  enum status: {
    cadastrado: 0,
    cadastro_em_andamento: 1,
    ativo: 2,
    inativo: 3,
    reprovado: 4
  }

  # Validações
  validates :nome, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :numero_contato, presence: true

  # Relacionamentos adicionais
  belongs_to :responsavel, class_name: "Usuario", optional: true
end
