
class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :usuario, null: false, foreign_key: true
      t.text :message, null: false
      t.string :status, default: "unread" # unread or read

      t.timestamps
    end
  end
end
