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

  # Match caregiver with client based on needs and availability
  def match_with_cliente(cliente)
    # Check if caregiver has the required specializations
    match_especializacoes = (cliente.necessidades & self.especializacoes).any?

    # Check if caregiver is available during preferred times
    match_horarios = self.disponibilidade.include?(cliente.horarios_preferidos)

    # Check if caregiver serves the client's region
    match_regioes = self.regioes_atendimento.include?(cliente.endereco_regiao)

    # All conditions must match
    match_especializacoes && match_horarios && match_regioes
  end

  # Notify user with a message
  def notify(message)
    notifications.create(message: message, status: "unread")
  end

  # Fetch unread notifications
  def unread_notifications
    notifications.where(status: "unread")
  end

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
