class Lender < ApplicationRecord
	has_secure_password
	has_many :transactions, dependent: :destroy
	has_many :borrowers_helped, through: :transactions, source: :borrower
	validates :first, :last, presence: true
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	before_save do
		self.email.downcase!
	end
end
