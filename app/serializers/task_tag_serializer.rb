# frozen_string_literal: true

class TaskTagSerializer < ActiveModel::Serializer
  attributes :id, :tag_id, :tag_name

  def tag_id
    object.tag.id
  end

  def tag_name
    object.tag.name
  end
end
