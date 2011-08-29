require 'test_helper'
 
class CreateAccountTest < ActionController::IntegrationTest
  fixtures :accounts
 
  context "create account" do
    get "/accounts/new"
    should respond_with :success
 
    post_via_redirect "/accounts", 
      :first_name => accounts(:one).first_name,
      :last_name => accounts(:one).last_name,
      :address1 => accounts(:one).address1,
      :address2 => accounts(:one).address2,
      :city => accounts(:one).city,
      :state => accounts(:one).state,
      :zip => accounts(:one).zip,
      :phone => accounts(:one).phone,
      :email => accounts(:one).email

    assert_equal '/accounts', path
    assert_equal 'Account successfully created.', flash[:notice]
 
    should assign_to :accounts
  end
end