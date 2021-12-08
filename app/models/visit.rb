# frozen_string_literal: true

class Visit < ApplicationRecord
  belongs_to :pat, class_name: 'User'
  belongs_to :doc, class_name: 'User'
  has_many :appointments

  validates :note, presence: true, length: { maximum: 100 }
end
