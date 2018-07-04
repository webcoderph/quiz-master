class Question < ApplicationRecord
  validates :title, presence: true
  validates :field_type, presence: true

end
