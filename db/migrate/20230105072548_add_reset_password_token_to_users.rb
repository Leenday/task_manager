class AddResetPasswordTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :reset_password_token_digest, :string
  end
end
