class CreatePagamentos < ActiveRecord::Migration[7.1]
  def change
    create_table :pagamentos do |t|
      t.decimal :valor, precision: 10, scale: 2
      t.integer :status, default: 0
      t.references :cliente, foreign_key: { to_table: :usuarios }
      t.references :servico, foreign_key: true

      t.timestamps
    end
  end
end
