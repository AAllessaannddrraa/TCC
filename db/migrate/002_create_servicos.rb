
class CreateServicos < ActiveRecord::Migration[6.1]
  def change
    create_table :servicos do |t|
      t.string :nome, null: false
      t.text :descricao, null: false
      t.decimal :preco, precision: 10, scale: 2, null: false
      t.datetime :data_agendamento
      t.references :cliente, null: false, foreign_key: { to_table: :usuarios }
      t.string :status, default: "pendente"
      t.timestamps
    end
  end
end
