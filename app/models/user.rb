# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  validates :nome, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :senha, length: { minimum: 6 }, allow_nil: true

  enum papel: { usuario: 'usuario', administrador: 'administrador' }

  # Example method for creating fake User data for testing
  def self.create_fake_users(count = 10)
    count.times do
      User.create(
        nome: Faker::Name.unique.name,
        email: Faker::Internet.unique.email,
        senha: 'password',
        papel: %w[usuario administrador].sample
      )
    end
  end
end
