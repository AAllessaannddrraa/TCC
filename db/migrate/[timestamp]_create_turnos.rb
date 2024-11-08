class CreateTurnos < ActiveRecord::Migration[6.1]
  def change
    create_table :turnos do |t|
      t.references :cuidador, foreign_key: true
      t.references :paciente, foreign_key: true
      t.date :data
      t.time :hora_inicio
      t.time :hora_fim
      t.text :observacoes
      t.integer :proximo_turno_cuidador

      t.timestamps
    end
  end
end
