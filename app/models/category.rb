# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :users
  validates :speciality, uniqueness: true
end
