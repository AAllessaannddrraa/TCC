class User < ApplicationRecord
  has_secure_password

  validates :nome, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :senha, length: { minimum: 6 }, allow_nil: true

  enum papel: { usuario: 'usuario', administrador: 'administrador' }
end
