module Events
  class EventsController < ApplicationController
    before_action :set_event, only: [:show]

    def index
      @events = Event.all
      @events = @events.by_course(params[:course]) if params[:course].present?
      @events = @events.by_type(params[:type]) if params[:type].present?
      @events = @events.with_finished if params[:with_finished] == 'true'
      @events = @events.paginate(:page => params[:page], :per_page => 20)
      @title = 'События клуба'

      respond_to do |format|
        format.html
        format.json { render json: @events }
      end
    end


    def show
      @meta_keywords = @event.meta_keywords if @event.meta_keywords.present?
      @title = @event.name

    end

    private

    def set_event
      @event = Event.find(params[:id])
    end
  end
end