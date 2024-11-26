class CreateCuidadorTreinamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :cuidador_treinamentos do |t|
      t.references :cuidador, null: false, foreign_key: { to_table: :cuidadores }
      t.references :treinamento, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim

      t.timestamps
    end
  end
end
