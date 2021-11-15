class User < ApplicationRecord
    attr_accessor :password
    validates :username, :session_token, presence: true
    validates_presence_of :password_digest, message: "Password can't be blank"
    validates :password, length: { minimum: 6, allow_nil: true }

    before_validation :ensure_session_token


    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        @session_token = SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save
    end

    def ensure_session_token 
        self.session_token ||= User.generate_session_token
    end

    def password=(password) #this is a plain text password
        #passing plain text password into BCrypt to get password_digest
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        Bcrypt::Password.new(@password_digest).is_password?(password)
    end

end
