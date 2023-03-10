class User < ApplicationRecord
    before_save {self.email = email.downcase}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {minimum:3, maximum:50},
                uniqueness: {case_sensitive: false}, 
                format: { with: VALID_EMAIL_REGEX}
    validate :user_name, presence:true
    validates :password_digest, presennce: true
    has_secure_password 
end
