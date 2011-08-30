class AccountsController < ApplicationController
	def index
		if params[:search]
			@accounts = Account.order(:last_name).where("last_name = ? OR first_name = ?", 
																																			params[:search], params[:search])
		else
			@accounts = Account.order(:last_name)
		end
	end

	def new
		@account = Account.new
	end

	def create
		@account = Account.new(params[:account])

		respond_to do |format|
			if @account.save
				Resque.enqueue(VerifyAccount, @account.id)
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