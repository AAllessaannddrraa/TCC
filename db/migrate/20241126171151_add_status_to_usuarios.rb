class AddStatusToUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_column :usuarios, :status, :integer
  end
end
