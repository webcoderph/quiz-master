class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, counter_cache: true
  
  validates :answer, presence: true
  
  scope :corrects, -> { where(correct: true) }
  
  def self.mine(user)
    where(user: user).first
  end
end
