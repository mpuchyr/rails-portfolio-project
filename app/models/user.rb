class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true
    validates :email, uniqueness: true

    validates :username, presence: true
    validates :username, uniqueness: true
end
