class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :password_digest # Ajustado para usar com has_secure_password
      t.string :papel, default: 'usuario'
      t.timestamps
    end

    # Adiciona índice único para garantir a unicidade do email
    add_index :usuarios, :email, unique: true
  end
end
