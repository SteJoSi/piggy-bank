class User < ApplicationRecord
    has_many :categories
    has_many :expenses, through: :categories
    
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :password, length: { minimum: 10 }
    validates :image_url, presence: true
end
