require 'test_helper'

class AccountTest < ActiveSupport::TestCase
		context "first name validation" do
	  should validate_presence_of :first_name
	  ["123", "bob_y", "dave!"].each do |value|
	  	should_not allow_value(value).for :first_name
	  end
	  ["Bob", "Joe Smith"].each do |value|
	  	should allow_value(value).for :first_name
	  end
	end
  
  context "last name validation" do
	  should validate_presence_of :last_name
	  ["123", "bob_y", "dave!"].each do |value|
	  	should_not allow_value(value).for :last_name
	  end
	  ["Bob", "Joe Smith", "O'Leary", "Hoffman-Clark"].each do |value|
	  	should allow_value(value).for :last_name
	  end
	end

  context "address1 validation" do
	  should validate_presence_of :address1
	  ["123 Fake! St", "123 Fake_St"].each do |value|
	  	should_not allow_value(value).for :address1
	  end
	  ["123 Fake St", "123 Fake St.", "PO Box 123"].each do |value|
	  	should allow_value(value).for :address1
	  end
	end

  context "city validation" do
	  should validate_presence_of :city
	  ["Chicago", "St Charles", "St. Charles"].each do |value|
	  	should allow_value(value).for :city
	  end
	end

  context "state validation" do
  	should validate_presence_of :state
  end

  context "zip validation" do
	  should validate_presence_of :zip
	  ["abc", "123", "123456"].each do |value|
	  	should_not allow_value(value).for :zip
	  end
	  ["12345", "123451234"].each do |value|
	  	should allow_value(value).for :zip
	  end
	end

	context "phone validation" do
		def test_should_not_allow_short_phone_numbers
			a = Account.new(:phone => "xxxxxxxxx")
			a.save

			assert a.errors[:phone].include? "is too short (minimum is 10 characters)"
		end
		should validate_numericality_of :phone
	end

  context "email validation" do
	  should validate_presence_of :email
	  ["abc", "!s@abc.com", "a@!d.com", "a@a.c0m"].each do |value|
	  	should_not allow_value(value).for :email
	  end
	  ["example@example.com", "1a@a.com", "a@2a.net"].each do |value|
	  	should allow_value(value).for :email
	  end
	end
end
