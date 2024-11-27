class CreateRelatorios < ActiveRecord::Migration[7.1]
  def change
    create_table :relatorios do |t|
      t.references :apoio, null: false, foreign_key: true
      t.text :conteudo

      t.timestamps
    end
  end
end
