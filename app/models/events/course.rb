module Events
  class Course < ActiveRecord::Base
    has_and_belongs_to_many :events, -> { uniq }, join_table: :courses_events, :class_name => 'Events::Event'
    validates :name, presence: true
  end
end
