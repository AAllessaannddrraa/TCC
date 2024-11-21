
class CreateSolicitations < ActiveRecord::Migration[6.1]
  def change
    create_table :solicitations do |t|
      t.references :cliente, null: false, foreign_key: { to_table: :usuarios }
      t.references :servico, null: false, foreign_key: true
      t.string :status, default: "pendente" # pending, approved, rejected
      t.text :observacoes

      t.timestamps
    end
  end
end
