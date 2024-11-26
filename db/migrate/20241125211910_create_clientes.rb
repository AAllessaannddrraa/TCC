class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :nome, null: false
      t.string :email, null: false, unique: true
      t.string :numero_contato, null: false, unique: true
      t.integer :status, default: 0
      t.references :responsavel, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
