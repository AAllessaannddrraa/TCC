class AddPapelToUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_column :usuarios, :papel, :string
  end
end
