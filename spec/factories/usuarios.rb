
FactoryBot.define do
  factory :usuario do
    nome { "Usuário Teste" }
    email { "usuario@example.com" }
    password { "password123" }
    role { "cliente" }
  end
end
