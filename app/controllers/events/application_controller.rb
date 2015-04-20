module Events
  class ApplicationController < ActionController::Base
    before_filter :authenticate_admin! if defined? Devise
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    layout 'admin/control'

    private

    def event_params
      params.require(:event).permit( :title )
    end

    def set_event
      @post = Post.find(params[:id])
    end

  end
end
