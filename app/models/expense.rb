class Expense < ApplicationRecord
    belongs_to :user
    belongs_to :category

    validates :name, presence: true
    validates :price, presence: true
end
