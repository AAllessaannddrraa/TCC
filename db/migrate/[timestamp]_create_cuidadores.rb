class CreateCuidadores < ActiveRecord::Migration[6.1]
  def change
    create_table :cuidadores do |t|
      t.string :nome, null: false
      t.integer :idade
      t.string :numero_contato, null: false
      t.string :email
      t.text :qualificacoes
      t.json :certificacoes
      t.json :historico_trabalho
      t.json :avaliacoes
      t.json :disponibilidade
      t.datetime :ultimo_login

      t.timestamps
    end
  end
end
