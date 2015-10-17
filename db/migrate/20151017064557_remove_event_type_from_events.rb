class RemoveEventTypeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events_events, :event_type, :string
  end
end
