# db/migrate/20241123015753_create_cuidadores.rb
class CreateCuidadores < ActiveRecord::Migration[7.1]
  def change
    create_table :cuidadores do |t|
      t.string :nome, null: false
      t.string :nif, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :numero_contato, null: false, unique: true
      t.integer :status, default: 0

      t.timestamps
    endclass CreateCuidadores < ActiveRecord::Migration[7.1]
    def change
      create_table :cuidadores do |t|
        t.string :nome, null: false
        t.string :email, null: false, index: { unique: true }
        t.string :numero_contato, null: false, index: { unique: true }
        t.string :nif, null: false, index: { unique: true }
        t.boolean :ativo, default: true
        t.timestamps
      end
    end
  end

  end
end
