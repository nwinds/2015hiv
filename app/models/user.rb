require 'digest/sha2'

class User < ActiveRecord::Base
	validates :name, :presence => true, :uiniqueness => true
	validates :password, :confirmation => true
	attr_accessor :password_confirmation
	attr_reader :password

	# why is validate?
	# vs php
	validate :password_must_be_present

	# but isn't it passing the name and password in CLEAN message?!
	# isn't it sending password and name in plain text?!(but sinece every one does it it *doesn't* matter?!)
	def User.authenticate(name, password)
		if user = find_by_name(name)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end
		end
	end


private:
	def password_must_be_present
		errors.add(:password, "Password Missing") unless hashed_password.present?
	end

	# salt's value should be secret
	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)# what fuck is "wibble"?(haven't heard befor)
	end
			
	# is 'rand' psuedo random function or not(since ruby is wirtten on c's lib)
	# suspicious
	# is this ok?(with an string with mac, and remenber it's on salt. something like tag then encrypt)
	# but since "wibble" seems obviousely in secure(I use the phase 'seems', cause I myself is not sure about it) 
	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end

	def password=(password)
		@password = password
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end
			
		
end
