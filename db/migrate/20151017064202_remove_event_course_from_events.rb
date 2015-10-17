class RemoveEventCourseFromEvents < ActiveRecord::Migration
  def change
    remove_column :events_events, :event_course, :string
  end
end
