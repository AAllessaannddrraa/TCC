class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nome, null: false
      t.string :email, null: false, unique: true
      t.string :senha_digest
      t.string :papel, default: 'usuario'
      t.timestamps
    end
  end
end
