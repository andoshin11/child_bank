class Api::WalletsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_wallet, only: [:show]

  def show
    render json: { wallet: @wallet }
  rescue
    render json: { error: 'delete failed' }, status: 422
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end


end
