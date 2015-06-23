require 'digest/sha2'

class User < ActiveRecord::Base
	# validation
	validates :name, :presence => true, :uniqueness => true
	# validates :password, :confirmation => true
	attr_reader :password
	validates_confirmation_of :password	

	# attr_reader :password

	validate :password_must_be_present

	# attr_accessible is ysed to create getter/setter, but here password and def password= are created manualy

	def User.authenticate(name, password)
		if user = find_by_name(name)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end
		end
	end
		
	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end

	def password_confirmation=(password_confirmation)
		@password_confirmation = password_confirmation
		if password_confirmation = @password
			return true
		end
		return false		
	end
	def password=(password)
		@password = password
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)	
		end	
	end

private
	def password_must_be_present
		errors.add(:password, "Password needed") unless hashed_password.present?
	end

	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s		
	end

		
end
