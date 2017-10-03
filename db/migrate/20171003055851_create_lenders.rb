class CreateLenders < ActiveRecord::Migration[5.1]
  def change
    create_table :lenders do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password_digest
      t.integer :money

      t.timestamps
    end
  end
end
