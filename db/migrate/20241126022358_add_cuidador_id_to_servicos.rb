class AddCuidadorIdToServicos < ActiveRecord::Migration[7.1]
  def change
    add_column :servicos, :cuidador_id, :integer
  end
end
