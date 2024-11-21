
class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :solicitation, null: false, foreign_key: true
      t.decimal :valor, precision: 10, scale: 2, null: false
      t.string :status, default: "pendente" # pending, paid, failed
      t.string :metodo_pagamento # e.g., cartão de crédito, boleto

      t.timestamps
    end
  end
end
