class CreateTreinamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :treinamentos do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
