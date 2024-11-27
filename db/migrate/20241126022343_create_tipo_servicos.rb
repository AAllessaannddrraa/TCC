class CreateTipoServicos < ActiveRecord::Migration[7.1]
  def change
    create_table :tipo_servicos do |t|
      t.string :nome, null: false
      t.text :descricao, null: false

      t.timestamps
    end
    add_index :tipo_servicos, :nome, unique: true
  end
end
