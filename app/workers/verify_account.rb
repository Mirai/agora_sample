class VerifyAccount
	@queue = :accounts_queue

	def self.perform(account_id)
		account = Account.find(account_id)
		account.update_attribute(:verified, true)
	end
end