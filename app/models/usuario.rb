class Usuario < ApplicationRecord
  # Inclua os módulos Devise necessários
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Outras associações e validações
  has_many :notifications
  has_many :apoios, foreign_key: :cliente_id

  # Validations
  validates :nome, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :nome, :email, :role, :status, presence: true
  validates :email, uniqueness: true

  # Associations
  has_many :servicos, foreign_key: :cliente_id, dependent: :destroy

  # Role checkers
  def admin?
    role == "admin"
  end

  def cuidador?
    role == "cuidador"
  end

  def cliente?
    role == "cliente"
  end

  def supervisora?
    role == "supervisora"
  end

  def financeiro?
    role == "financeiro"
  end

  def rh?
    role == "rh"
  end

  has_secure_password

  enum role: { admin: 0, rh: 1, supervisora: 2, cliente: 3, financeiro: 4 }
  enum status: { cadastrado: 0, ativo: 1, inativo: 2 }
end
