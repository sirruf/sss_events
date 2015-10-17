class CreateCoursesEvents < ActiveRecord::Migration
  def change
    create_table :courses_events, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :event, index: true
    end
  end
end
