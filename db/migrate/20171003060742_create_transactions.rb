class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :lender
      t.references :lender, foreign_key: true
      t.string :borrower
      t.references :borrower, foreign_key: true

      t.timestamps
    end
    add_index :transactions, :lender
    add_index :transactions, :borrower
  end
end
