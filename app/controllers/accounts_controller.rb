class AccountsController < ApplicationController
	def index
		@accounts = params[:search] ? Account.order(:last_name).where("last_name LIKE ? OR first_name LIKE ?", params[:search], params[:search]) : Account.order(:last_name)
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(params[:account])

		respond_to do |format|
			if @account.save
				format.html { redirect_to accounts_path, :notice => "Account was successfully created." }
				format.xml  { render :xml => @account, :status => :created, :location => @account }
				format.json { render :json => @account, :status => :created, :location => @account }
			else
				format.html { render 'new' }
				format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
				format.json { render :json => @account.errors, :status => :unprocessable_entity }
			end
		end
	end

	def edit
		@account = Account.find(params[:id])
	end

	def update
		@account = Account.find(params[:id])

		if @account.update_attributes(params[:account])
			redirect_to accounts_path, :notice => "Account was successfully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to accounts_path, :notice => "Account successfully deleted."
	end
end