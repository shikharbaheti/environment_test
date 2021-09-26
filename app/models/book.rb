class Book < ApplicationRecord
    validates :title, presence: true
    validates :price, presence: true
    validates :published, presence: true
    validates :author, presence: true
end