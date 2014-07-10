class Unsubscribe < ActiveRecord::Base
  schema_associations

  attr_accessor :subscribed

  scope :by_project_id, ->(project_id) { where(project_id: project_id) }

  def self.updates_unsubscribe project_id
    find_or_initialize_by(project_id: project_id)
  end

  def self.drop_all_for_project(project_id)
    by_project_id(project_id).destroy_all
  end
end
