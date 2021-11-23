class Category < ApplicationRecord
  has_many :users
  validates :speciality, uniqueness: true
end
