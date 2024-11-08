class CreatePacientes < ActiveRecord::Migration[6.1]
  def change
    create_table :pacientes do |t|
      t.string :nome, null: false
      t.integer :idade
      t.string :genero
      t.string :endereco
      t.string :numero_contato, null: false
      t.string :email
      t.text :historico_medico
      t.text :alergias
      t.text :medicamentos
      t.text :preferencias
      t.json :contatos_familiares

      t.timestamps
    end
  end
end
