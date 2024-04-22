require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :request do
  let!(:task) { create(:task) }

  describe "GET #index" do
    before do
      get api_v1_tasks_url
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected task attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.first.keys).to match_array(['id', 'title', 'task_tags'])
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      before do
        params = {
          title: 'demo',
          tags_attributes: [
            { name: 'demo tag1' } ,
            { name: 'demo tag2' }
          ]
        }

        post api_v1_tasks_url, params: params
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "JSON body response contains expected task attributes" do
        json_response = JSON.parse(response.body)
        expect(json_response.keys).to match_array(['id', 'title', 'task_tags'])
      end

      it "returns the correct values for attributes" do
        json_response = JSON.parse(response.body)
        expect(json_response['title']).to eq 'demo'
      end
    end

    context 'with invalid params' do
      before do
        params = {
          title: '',
        }

        post api_v1_tasks_url, params: params
      end

      it "returns http created" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
