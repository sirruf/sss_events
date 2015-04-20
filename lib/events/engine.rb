module Events
  class Engine < ::Rails::Engine
    isolate_namespace Events
    require 'rubygems'
    require 'russian'
    require 'acts_as_list'
    require 'will_paginate'
    require 'font-awesome-rails'
  end
end
