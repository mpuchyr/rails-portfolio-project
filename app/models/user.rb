class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true
    validates :email, uniqueness: true

    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :photoshoots
    has_many :locations, through: :photoshoots

    scope :filtered_by_location, -> (params) { where(location_id: params[:location])}
end
