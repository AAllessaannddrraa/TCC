
FactoryBot.define do
  factory :solicitation do
    association :cliente, factory: :usuario
    association :servico
    status { "pendente" }
  end
end
