class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :paciente, foreign_key: true
      t.references :cuidador, foreign_key: true
      t.date :data
      t.integer :nivel_satisfacao
      t.text :comentarios
      t.text :reclamacao

      t.timestamps
    end
  end
end
