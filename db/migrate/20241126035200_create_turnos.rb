class CreateTurnos < ActiveRecord::Migration[7.1]
  def change
    create_table :turnos do |t|
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :status
      t.references :cuidador, null: false, foreign_key: true
      t.references :servico, null: false, foreign_key: true

      t.timestamps
    end
  end
end
