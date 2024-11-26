class CreateEquipamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :equipamentos do |t|
      t.string :nome
      t.text :descricao
      t.references :apoio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
