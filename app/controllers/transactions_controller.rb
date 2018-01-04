class TransactionsController < ApplicationController
  before_action :find_transaction

  def index
    @transactions = Transaction.user(current_user.id).order(created_at: :desc)
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
      flash[:warn] = 'Update failed'
    end
    redirect_to transactions_path
  end

  def create
    transaction = Transaction.new(transaction_params)
    if transaction.save
      flash[:notice] = 'Transaction Complete'
    else
      flash[:warn] = 'Transaction Failed'
    end
    redirect_to transactions_path
  end

  def destroy
    if transaction.save
      flash[:notice] = 'Transaction deleted'
    else
      flash[:warn] = 'Could Not Delete'
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
