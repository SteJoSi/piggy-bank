class Category < ApplicationRecord
    has_many :expenses

    validates :name, presence: true, uniqueness: true
    validates :budget, presence: true
end
