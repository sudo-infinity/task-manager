# frozen_string_literal: true

module Api
  module V1
    class TasksController < BaseController
      actions :index, :create, :update, :destroy

      private

      def permitted_params
        params.permit(:title, task_tags_attributes: [:id, :_destroy, tag_attributes: [:name]])
      end
    end
  end
end
