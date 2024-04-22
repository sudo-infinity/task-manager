require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'assosciations' do
    it { should have_many(:task_tags) }
    it { should have_many(:tags).through(:task_tags) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end
end
