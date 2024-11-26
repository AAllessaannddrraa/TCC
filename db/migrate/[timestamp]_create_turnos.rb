class CreateTurnos < ActiveRecord::Migration[7.1]
  def change
    create_table :turnos do |t|
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :status, default: 0
      t.references :cuidador, foreign_key: { to_table: :cuidadores }
      t.references :servico, foreign_key: true

      t.timestamps
    end
  end
end
