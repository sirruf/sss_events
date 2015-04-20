class CreateEventsEvents < ActiveRecord::Migration
  def change
    create_table :events_events do |t|
      t.string :name
      t.string :event_course
      t.text :description
      t.string :event_type
      t.date :event_date
      t.time :event_time
      t.integer :image_id
      t.string :image_size

      t.timestamps
    end
  end
end
