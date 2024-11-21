
FactoryBot.define do
  factory :payment do
    association :solicitation
    valor { 100.0 }
    status { "pendente" }
    metodo_pagamento { "Cartão de Crédito" }
  end
end
