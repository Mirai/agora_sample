require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
	context "get index" do
	  setup do
	  	get :index
	  end

	  should assign_to :accounts
	  should respond_with :success
	  should render_with_layout
	  should render_template :index
	  should_not set_the_flash
	end

	context "get new" do
		setup do
			get :new
		end

		should assign_to :account
		should respond_with :success
		should render_with_layout
		should render_template :new
		should_not set_the_flash
	end

	context "post create" do
	  context "with valid data" do
	    setup do
	      post :create, :account => accounts(:one)
	    end

	    should assign_to :account
	    #should redirect_to accounts_path
	    should set_the_flash.to("Account was successfully created.")

	    should "create the record" do
	      assert Account.find_by_last_name(accounts(:one).last_name)
	    end
	  end

	  context "without valid data" do
	    setup do
	      post :create, :account => {}
	    end

	    should assign_to :account
	    should respond_with :success
	    should render_with_layout
	    should render_template :new
	    should_not set_the_flash
	  end
	end

	context "get edit" do
	  setup do
	    get :edit, :id => accounts(:one).id
	  end

	  should assign_to(:account){@account}
	  should respond_with :success
	  should render_with_layout
	  should render_template :edit
	  should_not set_the_flash
	end

	context "put update" do
	  context "with valid data" do
	    setup do
	      put :update, :id => accounts(:one).id, :account => {:last_name => 'Different'}
	    end

	    should assign_to(:account){@accout}
	    #should redirect_to accounts_path
	    should set_the_flash.to("Account was successfully updated.")

	    should "update the record" do
	      assert Account.find_by_last_name("Different")
	    end
	  end

	  context "with invalid data" do
	    setup do
	      put :update, :id => accounts(:one).id, :account => {:last_name => ""}
	    end

	    should assign_to(:account){@account}
	    should respond_with :success
	    should render_with_layout
	    should render_template :edit
	    should_not set_the_flash
	  end
	end

	context "deleting" do
	  setup do
	    delete :destroy, :id => accounts(:one).id
	  end

	  should assign_to(:account){@account}
	  #should redirect_to accounts_path
	  should set_the_flash.to("Account successfully deleted.")

	  should "delete the record" do
	    assert !Account.find(accounts(:one))
	  end
	end

end
