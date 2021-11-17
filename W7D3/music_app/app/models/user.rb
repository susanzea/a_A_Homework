# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password

    validates :password_digest, presence: true
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    after_initialize :ensure_session_token

    def self.generate_session_token
       SecureRandom::urlsafe_base64
    end

    def self.find_by_credentials(email, password)
        @user = User.find_by(email: email) #does it matter is user is an inst var or not here?
        if @user && @user.is_password?(password)
            @user
        else
            nil #would I want to actually render a like 'User not found' error here?
        end
    end
    
    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save! #raises true if success, exception if fails
        self.session_token
    end

    def password=(password)
        debugger
        self.password_digest = BCrypt::Password.create(password) #this results in  password inst but returns a string due to under the hood stuff so string is stored in car password_digest
        @password = password #why do I need this inst var? for the getter to work?
    end

    def is_password?(password)
        debugger
        password_obj = BCrypt::Password.new(self.password_digest) #turning string held in password_digest back into inst of Password so that we can use the  Password inst method is_password? on it. We are creating an is_password? method for the string
        password_obj.is_password?(password) #under the hood, Password#is_password? is checking to see if password_obj is equal to the result of creating an inst of Password with password as the input (password_obj == BCrypt::Password.new(password)). So Password#new is a hashing function, correct?
    end






end
