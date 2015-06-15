require 'digest/sha2'

class User < ActiveRecord::Base
	# attr_accessible is ysed to create getter/setter, but here password and def password= are created manualy

	attr_accessor :password

	# class method
	class << self
		def encrypt(password, salt)
			Digest::SHA2.hexdigest(password + "wibble" + salt)# what fuck is "wibble"?(haven't heard befor)
		end
	end

	def User.authenicate(name, password)
		if user = find_by_name(name)
			if user.hashed_password == encrypt(password, user.salt)
				user
			end
		end
	end
		

	# validation
	validates :name, :presence => true, :uniqueness => true
	validates :password, :confirmation => true


	# callbacks
	# from stackoverflow: just a callback and every thing is ok(encrypt before CREATEING an user)
	before_save :encrypt_password

protected
	def encrypt_password
		return if password.blank?
		if new_record?
			self.salt = Digest::SHA2.hexdigest(password + "wibble" + salt)
		end
		self.encrypted_password = User.encrypt(password, salt)
	end

		
end
