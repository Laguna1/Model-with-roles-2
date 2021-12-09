# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :visit
  belongs_to :pat, class_name: 'User'
  belongs_to :doc, class_name: 'User'

  validates :visit_id, uniqueness: true
  validates :recomendation, presence: true, length: { minimum: 20 }
end
