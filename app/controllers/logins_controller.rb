class LoginsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	borrower = Borrower.find_by(email: params[:email])
	lender = Lender.find_by(email: params[:email])
		if lender && lender.authenticate(params[:password])
			session[:user_id] = lender.id
			redirect_to "/lenders/#{lender.id}"
		elsif borrower && borrower.authenticate(params[:password])
			session[:user_id] = borrower.id
			redirect_to "/borrowers/#{borrower.id}"
		else
			flash[:errors] = ['Invalid Combination']
			redirect_back fallback_location: root_path
		end
	  end

  def destroy
  	if session[:user_id]
  		session[:user_id] = nil
  	end
  	redirect_to "/"
  end
end
