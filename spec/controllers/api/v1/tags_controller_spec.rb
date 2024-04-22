require 'rails_helper'

RSpec.describe Api::V1::TagsController, type: :request do
  describe "GET #index" do
    let(:task_1) { create(:task) }
    let(:task_2) { create(:task) }
    let(:task_3) { create(:task) }
    let(:task_4) { create(:task) }

    let(:tag_1) { create(:tag) }
    let(:tag_2) { create(:tag) }

    before do
      create(:task_tag, tag: tag_1, task: task_1)
      create(:task_tag, tag: tag_1, task: task_2)
      create(:task_tag, tag: tag_1, task: task_3)
      create(:task_tag, tag: tag_2, task: task_4)

      get api_v1_tags_url
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should JSON body response contains expected task attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.first.keys).to match_array(['id', 'name', 'tasks_count'])
    end

    it "should verify tasks count against every task" do
      json_response = JSON.parse(response.body)

      expect(json_response.first['tasks_count']).to eq(3)
      expect(json_response.last['tasks_count']).to eq(1)
    end
  end
end
