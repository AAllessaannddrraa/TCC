class AddAtivoToCuidadores < ActiveRecord::Migration[7.1]
  def change
    add_column :cuidadores, :ativo, :boolean
  end
end
