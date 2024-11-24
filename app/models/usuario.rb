class Usuario < ApplicationRecord
  # Devise modules for authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :nome, presence: true, length: { minimum: 3 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  # Associations
  has_many :servicos, foreign_key: :cliente_id, dependent: :destroy

  # Check if the user is an admin
  def admin?
    role == "admin"
  end

  # Check if the user is a caregiver
  def cuidador?
    role == "cuidador"
  end

  # Check if the user is a client
  def cliente?
    role == "cliente"
  end
end
