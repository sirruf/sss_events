class AddAnnounceToEventsEvents < ActiveRecord::Migration
  def change
    add_column :events_events, :announce, :text
  end
end
