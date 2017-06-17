class AddPointToWallet < ActiveRecord::Migration[5.1]
  def change
    add_column :wallets, :point, :integer
  end
end
