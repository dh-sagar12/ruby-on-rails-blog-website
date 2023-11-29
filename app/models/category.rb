class Category < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 25 }
  belongs_to :creator, class_name: "User"
  has_many :article_categories
  has_many :articles, through: :article_categories
end
