class AddPasswordDigestToUsuarios < ActiveRecord::Migration[7.1]
  def change
    # Verifique se a coluna já existe antes de tentar adicioná-la
    unless column_exists?(:usuarios, :encrypted_password)
      add_column :usuarios, :encrypted_password, :string, null: false, default: ""
    end
  end
end
