class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.references :cuidador, null: false, foreign_key: { to_table: :cuidadores }
      t.references :cliente, null: false, foreign_key: { to_table: :usuarios }
      t.integer :avaliacao
      t.text :comentario

      t.timestamps
    end
  end
end
