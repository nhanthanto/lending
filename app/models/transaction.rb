class Transaction < ApplicationRecord
  belongs_to :lender
  belongs_to :borrower
end
