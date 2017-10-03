class CreateBorrowers < ActiveRecord::Migration[5.1]
  def change
    create_table :borrowers do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :password_digest
      t.integer :money
      t.string :reason
      t.text :description
      t.integer :raised

      t.timestamps
    end
  end
end
