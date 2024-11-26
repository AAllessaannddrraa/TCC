class CreatePacientes < ActiveRecord::Migration[7.1]
  def change
    create_table :pacientes do |t|
      t.string :nome, null: false
      t.integer :idade, null: false
      t.text :condicoes, null: false
      t.integer :estado_saude, default: 0
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
