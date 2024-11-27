class CreateTurnos < ActiveRecord::Migration[7.1]
  def change
    create_table :turnos do |t|
      t.references :cuidador, null: false, foreign_key: { to_table: :cuidadores }
      t.references :servico, null: false, foreign_key: true
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
