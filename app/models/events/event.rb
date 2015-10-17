module Events
  class Event < ActiveRecord::Base
    validates :name, :event_type, :event_course, :event_date, :event_time, presence: true

    has_and_belongs_to_many :courses, join_table: :courses_events, :class_name => 'Events::Course'
    has_and_belongs_to_many :categories, join_table: :categories_events, :class_name => 'Events::Category'

    # default_scope  { where('event_date > ?', Time.now) }
    scope :at_this_month, -> { where('event_date > ? AND event_date < ?', Time.now.beginning_of_month, Time.now.end_of_month) }
    scope :unfinished_only, -> { where('event_date > ?', Time.now) }
    scope :with_finished, -> { order(event_date: :desc) }


    def image_url
      # noinspection RubyResolve
      image = Photos::Picture.find_by(id: self.image_id)
      if image.present?
        # noinspection RubyResolve
        self.image_size.present? ? image.image.thumb(self.image_size).url : image.image.url
      end
    rescue
      nil
    end

    def finished?
      self.event_date < Time.now
    end

    def self.by_course(course_id = nil)
      course = Course.find_by(id: course_id)
      course.events
    end

    def self.by_category(category_id = nil)
      category = Category.find_by(id: category_id)
      category.events
    end

  end
end
