class AddPapelToUsuarios < ActiveRecord::Migration[7.1]
  def change
    # Verifique se a coluna já existe antes de tentar adicioná-la
    unless column_exists?(:usuarios, :papel)
      add_column :usuarios, :papel, :string
    end
  end
end
