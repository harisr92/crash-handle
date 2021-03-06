class TransactionsController < ApplicationController
  before_action :find_transaction

  def index
    @transactions = current_user.transactions.order(created_at: :desc)
  end

  def show() end

  def edit() end

  def new
    @transaction = Transaction.new
  end

  def update
    if @transaction.update(transaction_params)
      flash[:notice] = 'Updated the Transaction'
    else
      flash[:alert] = 'Update failed'
    end
    redirect_to transactions_path
  end

  def create
    transaction = current_user.transactions.new(transaction_params)
    if transaction.save
      flash[:notice] = 'Transaction Complete'
    else
      flash[:alert] = 'Transaction Failed'
    end
    redirect_to transactions_path
  end

  def destroy
    if transaction.save
      flash[:notice] = 'Transaction deleted'
    else
      flash[:alert] = 'Could Not Delete'
    end
    redirect_to transactions_path
  end

  private

  def find_transaction
    return unless params[:id]
    @transaction = Transaction.user(current_user.id).find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :withdrawls, :deposits,
                                        :balance, :user_id)
  end
end
