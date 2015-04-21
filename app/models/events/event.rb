module Events
  class Event < ActiveRecord::Base
    validates :name, :event_type, :event_course, :event_date, presence: true

    COURSES = [
        ['Конный клуб', :hourse_club],
        ['Лагерь', :camp],
        ['Экскурсии и мастерклассы', :tour],
        ['Программы для школ', :for_school],
        ['Общее', :common]
    ]
    TYPES = [
        ['Соревнование', :competition],
        ['Праздник', :holiday],
        ['Открытие смены', :open_session],
        ['Закрытие смены', :close_session],
        ['Прочее', :other]
    ]

    scope :by_course, ->(event_course) { where('event_course = ?', event_course) }
    scope :by_type, ->(event_type) { where('event_type = ?', event_type) }
    scope :at_this_month, where("event_date > ? AND < ?", Time.now.beginning_of_month, Time.now.end_of_month)

    def self.available_types
      TYPES.sort
    end

    def self.available_courses
      COURSES.sort
    end

    def course_name
      index = COURSES.map{|e| e.include?(self.event_course.to_sym)}.to_a.index(true)
      COURSES[index][0] if index.present?
    end

    def type_name
      index = TYPES.map{|e| e.include?(self.event_type.to_sym)}.to_a.index(true)
      TYPES[index][0] if index.present?
    end

    def image_url
      image = Photos::Picture.find_by(id: self.image_id)
      if image.present?
        self.image_size.present? ? image.image.thumb(self.image_size).url : image.image.url
      end
    rescue
      nil
    end

  end
end
