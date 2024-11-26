class CreateServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :servicos do |t|
      t.string :nome, null: false
      t.text :descricao, null: false
      t.decimal :preco, null: false
      t.integer :status, null: false, default: 0
      t.references :tipo_servico, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: { to_table: :usuarios }
      t.references :cuidador, foreign_key: true
      t.date :data_agendamento, null: false

      t.timestamps
    end
  end
end
