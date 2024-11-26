class AddEncryptedPasswordToUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_column :usuarios, :encrypted_password, :string
  end
end
