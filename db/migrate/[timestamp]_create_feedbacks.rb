class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.integer :avaliacao
      t.text :comentario
      t.references :cuidador, foreign_key: true
      t.references :cliente, foreign_key: { to_table: :usuarios }

      t.timestamps
    end
  end
end
