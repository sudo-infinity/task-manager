class TaskTag < ApplicationRecord
  belongs_to :task
  belongs_to :tag

  validates :task, uniqueness: { scope: :tag }

  accepts_nested_attributes_for :tag, reject_if: :all_blank, allow_destroy: true

  def autosave_associated_records_for_tag
    self.tag = Tag.find_or_create_by(name: tag.name)
  end
end
