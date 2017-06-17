class SetDefaultValueToWallet < ActiveRecord::Migration[5.1]
  def change
    change_column :wallets, :point, :integer, default: 0
  end
end
