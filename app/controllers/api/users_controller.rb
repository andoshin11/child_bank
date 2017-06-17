class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  # before_action :set_wallet, only: [:show]

  def index
    @users = User.all
  end

  def show
    render json: { data: @wallet }
  rescue
    render json: { error: 'delete failed' }, status: 422
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:id])
  end


end
