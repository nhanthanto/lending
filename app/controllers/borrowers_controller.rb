class BorrowersController < ApplicationController
  def create
	borrower = Borrower.new(borrower_params)
		if borrower.save
		session[:user_id] = borrower.id
		redirect_to "/borrowers/#{borrower.id}"
		else
    flash[:errors] = "Invalid Combination"
		redirect_back fallback_location: root_path
		end
  end

  def show
    @borrower = Borrower.find(params[:id])
    @trans = Transaction.where(borrower_id: session[:user_id])
  end

  private
  	def borrower_params
  		params.require(:borrower).permit(:first, :last, :email, :password, :reason, :description, :money, :raised)
  	end
end
