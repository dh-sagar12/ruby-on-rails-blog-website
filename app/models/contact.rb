class Contact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 6, maximum: 50 }
  validates :message, presence: true, length: { minimum: 6, maximum: 150 }
end
