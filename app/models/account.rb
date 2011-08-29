class Account < ActiveRecord::Base
	validates :first_name, :presence => true, :format => /\A[a-z ]+\z/i
	validates :last_name, :presence => true, :format => /\A[a-z '-]+\z/i
	validates :address1, :presence => true, :format => /\A[a-z0-9 \.]+\z/i
	validates :city, :presence => true, :format => /\A[a-z \.]+\z/i
	validates :state, :presence => true
	validates :zip, :presence => true, :format => /\A(\d{5}|\d{9})\z/
	validates :phone, :length => {:minimum => 10}, :numericality => true, :allow_blank => true
	validates :email, :presence => true, :format => /\A[a-z\d._%+-]+@(?:[a-z\d-]+\.)+[a-z]{2,4}\z/i
end