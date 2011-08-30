require 'test_helper'
 
class SearchAccountsTest < ActionController::IntegrationTest
  fixtures :accounts
 
  def test_account_search
    get_via_redirect "/accounts", :search => accounts(:one).last_name
    assert_response :success
 
    assert_equal '/accounts', path
    assert_not_nil assigns(:accounts)

    assert assigns(:accounts).include?(accounts(:one)), "Should include :one"
    assert !assigns(:accounts).include?(accounts(:two)), "Should not include :two"
  end
end