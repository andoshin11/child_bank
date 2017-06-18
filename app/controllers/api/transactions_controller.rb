class Api::TransactionsController < ApplicationController
  protect_from_forgery with: :null_session

  def execute
    parent_id = params[:parentId]
    child_id = params[:childId]
    amount = params[:amount]

    Transaction.execute(parent_id, child_id, amount)
    render json: { message: "Success" }
  rescue
    render json: { error: 'delete failed' }, status: 422
  end

  def charge
    parent_id = params[:parentId]
    child_id = params[:childId]
    amount = params[:amount]

    Transaction.charge(parent_id, child_id, amount)
    render json: { message: "Success" }
  rescue
    render json: { error: 'delete failed' }, status: 422
  end

  def exchange
    parent_id = params[:parentId]
    amount = params[:amount]

    Transaction.exchange(parent_id, amount)
    render json: { message: "Success" }
  rescue
    render json: { error: 'delete failed' }, status: 422
  end

  def history
    user_id = params[:id]
    users = User.all

    transactions = Transaction.where("(child_id = ?) OR (parent_id = ?)", user_id, user_id)


    @history = transactions.map do |transaction|
      target_user_id = transaction.category == 0 ? transaction.child_id : transaction.parent_id
      {
        transaction: transaction,
        target_user: users.find(target_user_id)
      }
    end

    render json: { data: @history.reverse }
  rescue
    render json: { error: 'delete failed' }, status: 422
  end

  def history_all
    transactions = Transaction.all

    render json: { data: transactions.reverse }
  rescue
    render json: { error: 'delete failed' }, status: 422
  end


end
