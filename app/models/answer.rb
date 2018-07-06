class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true
  
  validates :answer, presence: true
end
