module Events
  module Admin
    class EventsController < ApplicationController
      before_filter :authenticate_admin! if defined? Devise
      before_action :set_event, only: [:show, :edit, :update, :destroy]

      layout 'admin/control'

      def index
        @events = Event.all.paginate(:page => params[:page], :per_page => 20)
      end

      def new
        @event = Event.new
      end

      def show
      end

      def edit
      end

      def create
        @event = Event.new(event_params)

        respond_to do |format|
          if @event.save
            format.html { redirect_to edit_admin_event_path(@event), notice: 'Event was successfully created.' }
            format.json { render action: 'show', status: :created, location: @event }
          else
            format.html { render action: 'new' }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @event.update(event_params)
            format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @event.destroy
        respond_to do |format|
          format.html { redirect_to admin_events_url }
          format.json { head :no_content }
        end
      end

      private

      def event_params
        params.require(:event).permit( :name, :description, :event_course, :event_type, :event_date, :event_time, :image_id, :image_size )
      end

      def set_event
        @event = Event.find(params[:id])
      end

    end
  end
end