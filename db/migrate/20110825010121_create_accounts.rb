class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
