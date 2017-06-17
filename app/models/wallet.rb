class Wallet < ApplicationRecord
  belongs_to :user, inverse_of: :wallet

  def add_points(num)
    return unless num
    current_point = self.point
    self.update(point: current_point + num)
  end

  def subtract_points(num)
    return unless num
    current_point = self.point
    self.update(point: current_point - num)
  end
end
