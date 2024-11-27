# Renomear o modelo Admin para evitar conflito com o módulo Admin
class AdminUser < ApplicationRecord
  # Validações
  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Associações (se houver)
  # has_many :alguma_associacao

  # Métodos adicionais (se necessário)
end

# Exemplo de atualização em um controlador ou outro arquivo
@admin_users = AdminUser.all
