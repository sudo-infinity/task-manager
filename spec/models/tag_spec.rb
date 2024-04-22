require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'assosciations' do
    it { should have_many(:task_tags) }
    it { should have_many(:tasks).through(:task_tags) }
  end
end
