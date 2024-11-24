# app/models/cuidador.rb
class Cuidador < ApplicationRecord
  has_many :turnos
  has_many :feedbacks

  validates :nome, presence: true
  validates :nif, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :numero_contato, presence: true, uniqueness: true

  # Método para criar dados fictícios de cuidadores para testes
  def self.create_fake_cuidadores(count = 10)
    count.times do
      Cuidador.create!(
        nome: Faker::Name.name,
        data_nascimento: Faker::Date.birthday(min_age: 18, max_age: 65),
        genero: ['Masculino', 'Feminino'].sample,
        nif: Faker::Number.unique.number(digits: 9).to_s,
        nic: Faker::Number.unique.number(digits: 8).to_s,
        endereco: Faker::Address.full_address,
        telefone_principal: Faker::PhoneNumber.cell_phone,
        telefone_secundario: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.unique.email,
        numero_contato: Faker::PhoneNumber.cell_phone,
        experiencia: rand(1..20),
        especializacoes: "Cuidados com idosos, Cuidados paliativos",
        certificacoes: "Curso de primeiros socorros, Curso de cuidador de idosos",
        disponibilidade: "Segunda a sexta, 08:00 às 18:00",
        idiomas: "Português, Inglês",
        habilidades: "Dirigir, Cozinhar, Limpeza, Administração de medicamentos",
        tipos_servicos: "Cuidados pessoais, Serviços domésticos, Cuidados médicos",
        nacionalidade: "Portuguesa",
        codigo_pais_telefone: "+351",
        telefone_emergencia: Faker::PhoneNumber.cell_phone,
        filhos_e_idades: "Filho 1: 10 anos, Filho 2: 5 anos",
        formacao: "Ensino Médio Completo, Curso Técnico de Enfermagem",
        certidao_criminal: "Sem antecedentes criminais",
        status_selecao: "Aprovado",
        gestor_responsavel: "Gestor Exemplo"
      )
    end
  end
end
