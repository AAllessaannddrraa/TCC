class CreateApoios < ActiveRecord::Migration[6.1]
  def change
    create_table :apoios do |t|
      t.references :cliente, null: false, foreign_key: { to_table: :usuarios }
      t.references :supervisora, null: true, foreign_key: { to_table: :usuarios }
      t.text :descricao
      t.string :status
      t.date :data_inicio
      t.date :data_fim

      t.timestamps
    end
  end
end
