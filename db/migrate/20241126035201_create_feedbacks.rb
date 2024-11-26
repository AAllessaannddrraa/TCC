class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.integer :avaliacao
      t.text :comentario
      t.references :cuidador, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
