class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :transaction_id
      t.integer :parent_id, index: true, null: false
      t.integer :child_id, index: true, null: false
      t.integer :amount, null: false
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
