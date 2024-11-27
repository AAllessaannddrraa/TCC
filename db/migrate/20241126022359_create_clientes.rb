class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :numero_contato, null: false
      t.integer :status, default: 0
      t.references :responsavel, foreign_key: { to_table: :usuarios }

      t.timestamps
    end

    # Adicionar índices únicos
    add_index :clientes, :email, unique: true
    add_index :clientes, :numero_contato, unique: true
  end
end
