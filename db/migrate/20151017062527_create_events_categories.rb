class CreateEventsCategories < ActiveRecord::Migration
  def change
    create_table :events_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
