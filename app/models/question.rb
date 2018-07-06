class Question < ApplicationRecord
  validates :title, presence: true
  validates :answer, presence: true
  validates_uniqueness_of :title
  validates_length_of :title, maximum: 50
  
  has_many :user_answers, class_name: 'Answer', dependent: :destroy
  
  default_scope -> { order('created_at DESC') }
  scope :active, -> { where(active: true) }
  
  def self.top_recent
    limit(3)
  end

  def self.top_scores
    0
  end
end
