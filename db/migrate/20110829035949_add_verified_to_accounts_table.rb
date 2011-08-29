class AddVerifiedToAccountsTable < ActiveRecord::Migration
  def self.up
    add_column :accounts, :verified, :boolean, :default => false
  end

  def self.down
    remove_column :accounts, :verified
  end
end
