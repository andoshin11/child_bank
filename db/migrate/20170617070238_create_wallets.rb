class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.references :user,  index: true, foreign_key: true

      t.timestamps
    end
  end
end
