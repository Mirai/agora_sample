require 'test_helper'
 
class CreateAccountTest < ActionController::IntegrationTest
  fixtures :accounts
 
  def test_account_creation
    get "/accounts/new"
    assert_response :success
 
    post_via_redirect "/accounts", :account => accounts(:one).attributes

    assert_equal '/accounts', path
    assert_equal 'Account was successfully created.', flash[:notice]
 
    assert_not_nil assigns(:accounts)
  end
end