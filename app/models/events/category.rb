module Events
  class Category < ActiveRecord::Base
    has_and_belongs_to_many :events, -> { uniq }, join_table: :categories_events, :class_name => 'Events::Event'
    validates :name, presence: true
  end
end
