class CreateEventsCourses < ActiveRecord::Migration
  def change
    create_table :events_courses do |t|
      t.string :name

      t.timestamps
    end
  end
end
