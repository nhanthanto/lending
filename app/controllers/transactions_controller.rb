class TransactionsController < ApplicationController
  def create
	lender = Lender.find(session[:user_id])
	transaction = Transaction.new(trans_params)
	if lender.money - transaction[:amount] < 0
		flash[:errors] = "Amount lent is more than Balance"
		redirect_back fallback_location: root_path
	elsif transaction.save
		borrower = Borrower.find(transaction[:borrower_id])
		lender.money = lender.money - transaction[:amount]
		lender.save
		borrower.raised = borrower.raised + transaction[:amount]
		borrower.save
		redirect_back fallback_location: root_path
	else
		flash[:errors] = "Something went wrong"
		redirect_back fallback_location: root_path
	end
  end
  private 
  	def trans_params
  		params.require(:transaction).permit(:amount, :lender_id, :borrower_id)
  	end	
end
