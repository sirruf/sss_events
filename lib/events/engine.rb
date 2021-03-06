module Events
  class Engine < ::Rails::Engine
    isolate_namespace Events
    config.to_prepare do
      # Make the implementing application's helpers available to the engine.
      # This is required for the overriding of engine views and helpers to work correctly.
      Events::ApplicationController.helper Rails.application.helpers
    end
    require 'rubygems'
    require 'russian'
    require 'acts_as_list'
    require 'will_paginate'
    require 'font-awesome-rails'
    require 'jquery-rails'
    require 'jquery-ui-rails'
    require 'jquery-timepicker-rails'
  end
end
