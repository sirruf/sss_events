# root_path and root_url are defined for the engine, so those still need to be handled differently.
# This issue could happend for any routes that overlap.
#
# (main_app||self).root_path
#
# And the other way if you want to link to the engines root_path. blogit is the engine_name.
#
# (blogit||self).root_path
#
#

module Events
  module ApplicationHelper
    # include ApplicationHelper
    def method_missing method, *args, &block
      puts "Events Module LOOKING FOR ROUTES #{method}"
      if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
        if main_app.respond_to?(method)
          main_app.send(method, *args)
        else
          super
        end
      else
        super
      end
    end

    def respond_to?(method)
      if method.to_s.end_with?('_path') or method.to_s.end_with?('_url')
        if main_app.respond_to?(method)
          true
        else
          super
        end
      else
        super
      end
    end
  end
end

config = YAML.load_file("#{Rails.root}/config/modules_config.yml")['modules']['events']
if config.present?
  config.each do |key, value|
    Events.send("#{key}=", value) rescue nil
  end
end

unless Events.admin_namespace.present?
  Events.send("admin_namespace=", 'admin') rescue nil
end
unless Events.courses_support.present?
  Events.send("courses_support=", false) rescue nil
end
