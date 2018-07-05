class Question < ApplicationRecord
  validates :title, presence: true
  validates :answer, presence: true
  validates_uniqueness_of :title
  
  has_many :answers
  
  def self.top_recent
    limit(10)
  end

  def self.top_scores
    0
  end
end
