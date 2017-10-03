class WelcomeController < ApplicationController
  def index
  end
  def charities
  	@borrower = Borrower.all 
  end
  def benefactors
  	@lender = Lender.all 
  end
end
