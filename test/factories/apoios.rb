FactoryBot.define do
  factory :apoio do
    cliente { nil }
    supervisora { nil }
    descricao { "MyText" }
    status { "MyString" }
    data_inicio { "2024-11-25" }
    data_fim { "2024-11-25" }
  end
end
