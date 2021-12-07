class Visit < ApplicationRecord
  belongs_to :pat, class_name: 'User'
  belongs_to :doc, class_name: 'User'
end