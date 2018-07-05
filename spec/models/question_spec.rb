require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { described_class.new }

  it { should validate_presence_of(:title) } 

  it { should validate_presence_of(:answer) }

  it { should validate_uniqueness_of(:title) }

  it { should have_many(:answers) }
end
