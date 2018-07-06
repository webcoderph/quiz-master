require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { described_class.new }

  it { should validate_presence_of(:title) } 

  it { should validate_presence_of(:answer) }

  it { should validate_uniqueness_of(:title) }
  
  it { should validate_length_of(:title).is_at_most(50) }

  it { should have_one(:user_answer) }
end
