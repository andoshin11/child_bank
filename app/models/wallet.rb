class Wallet < ApplicationRecord
  belongs_to :user, inverse_of: :wallet
end
