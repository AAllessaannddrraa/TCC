class CreateCuidadores < ActiveRecord::Migration[7.1]
  def change
    create_table :cuidadores do |t|
      t.string :nome, null: false
      t.string :nif, null: false
      t.string :email, null: false
      t.string :numero_contato, null: false
      t.integer :status, default: 0

      t.timestamps
    end

    # Adicionar índices únicos
    add_index :cuidadores, :nif, unique: true
    add_index :cuidadores, :email, unique: true
    add_index :cuidadores, :numero_contato, unique: true
  end
end
