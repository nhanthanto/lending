class LendersController < ApplicationController
  def create
	lender = Lender.new(lender_params)
		if lender.save
		session[:user_id] = lender.id
		redirect_to "/lenders/#{lender.id}"
		else
    flash[:errors] = "Invalid Combination"
		redirect_back fallback_location: root_path
		end
  end

  def show
    @lender = Lender.find(params[:id])
    @borrower = Borrower.all
    @trans = Transaction.where(lender_id: session[:user_id])
      
  end

  private
  	def lender_params
  		params.require(:lender).permit(:first, :last, :email, :password, :money)
  	end
end
