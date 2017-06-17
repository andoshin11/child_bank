class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  # devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable,
          # :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_one :wallet, dependent: :destroy, inverse_of: :user

  after_create :create_wallet

  private
    def create_wallet
      Wallet.create(user_id: self.id)
    end
end
