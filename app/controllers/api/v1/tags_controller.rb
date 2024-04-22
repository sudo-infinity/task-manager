# frozen_string_literal: true

module Api
  module V1
    class TagsController < BaseController
      actions :index

      protected

      def resources
        @resources = Tag.joins(:task_tags)
                        .select('tags.*, COUNT(task_tags.task_id) as tasks_count')
                        .group("tags.id").order("tasks_count DESC")
      end
    end
  end
end
