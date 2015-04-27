class AddMetaKeywordsToEventsEvents < ActiveRecord::Migration
  def change
    add_column :events_events, :meta_keywords, :text
  end
end
