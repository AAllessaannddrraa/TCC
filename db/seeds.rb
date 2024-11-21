default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: apoiar_system
  password: senha123 # Substitua pela senha que você configurou no PostgreSQL
  host: localhost

development:
  <<: *default
  database: apoiar_system_development

test:
  <<: *default
  database: apoiar_system_test

production:
  <<: *default
  database: apoiar_system_production
