class AddStatusToCuidadores < ActiveRecord::Migration[7.1]
  def change
    add_column :cuidadores, :status, :string, default: "cadastrado"
  end
end
