class Transaction < ApplicationRecord

  def self.execute(parent_id, child_id, amount)
      transaction_id = parent_id.to_s + child_id.to_s + amount.to_s + Time.now.to_i.to_s
      parent_wallet = User.find(parent_id).wallet
      child_wallet = User.find(child_id).wallet

      Wallet.transaction do
        Transaction.create(parent_id: parent_id, child_id: child_id, amount: amount, transaction_id: transaction_id, category: 0)
        Transaction.create(parent_id: child_id, child_id: parent_id, amount: amount, transaction_id: transaction_id, category: 1)
        parent_wallet.subtract_points(amount)
        child_wallet.add_points(amount)
      end
  end
end
