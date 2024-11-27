class AddOtpSecretToUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_column :usuarios, :otp_secret, :string
  end
end
