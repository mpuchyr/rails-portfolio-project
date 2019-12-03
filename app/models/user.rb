class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true
    validates :email, uniqueness: true

    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :photoshoots
    has_many :locations, through: :photoshoots
end
