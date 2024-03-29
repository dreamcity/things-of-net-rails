class User < ActiveRecord::Base
	has_many :sensors, dependent: :destroy
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :name, presence: true, length: { :in => 2..30 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence: true, 
					uniqueness: { case_sensitive: false },
					format: { with: VALID_EMAIL_REGEX }
	has_secure_password
	validates :password, length: { :in => 6..20  }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private 
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
