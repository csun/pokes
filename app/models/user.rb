class User < ActiveRecord::Base
	attr_accessor :password, :password_confirmation
	before_save :encrypt_password

	has_many :pokes, foreign_key: 'receiver_id'
	has_many :sent_pokes, class_name: 'Poke', foreign_key: 'sender_id'

	validates :password, confirmation: true
	validates :password_confirmation, presence:true
	validates :username, presence: true, uniqueness: true

	def encrypt_password
		if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
	end

	def self.authenticate(username, password)
		user = find_by_username username

		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
end
