
FactoryBot.define do
  factory :notification do
    association :usuario
    message { "Teste de notificação" }
    status { "unread" }
  end
end
