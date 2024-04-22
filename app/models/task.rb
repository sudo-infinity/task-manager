class Task < ApplicationRecord
  has_many :task_tags, inverse_of: :task
  has_many :tags, through: :task_tags

  accepts_nested_attributes_for :task_tags, allow_destroy: true

  validates :title, presence: true

  # FIXME: Not working for now
  # def autosave_associated_records_for_task_tags
  #   task_tags.each do |task_tag|
  #     if task_tag._destroy
  #       self.task_tags.delete(task_tag)
  #     end
  #   end
  # end
end
