module Events
  module Admin
    class CoursesController < ApplicationController
      # noinspection RailsParamDefResolve,RubyResolve
      before_filter :authenticate_admin! if defined? Devise
      before_action :set_course, only: [:show, :edit, :update, :destroy]
      before_action :set_breadcrumbs, only: [:show, :edit, :new, :index]

      layout 'admin/control'

      def index
        @courses = Course.unscoped.paginate(:page => params[:page], :per_page => 20)
      end

      def new
        # noinspection RubyArgCount
        @course = Course.new
      end

      def show
      end

      def edit
      end

      def create
        @course = Course.new(course_params)

        respond_to do |format|
          if @course.save
            format.html { redirect_to admin_courses_path, notice: 'Course was successfully created.' }
            format.json { render action: 'show', status: :created, location: @course }
          else
            format.html { render action: 'new' }
            format.json { render json: @course.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @course.update(course_params)
            format.html { redirect_to admin_courses_path, notice: 'Course was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @course.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @course.destroy
        respond_to do |format|
          format.html { redirect_to admin_courses_url }
          format.json { head :no_content }
        end
      end

      private

      def course_params
        params.require(:course).permit( :name )
      end

      def set_course
        @course = Course.unscoped.find(params[:id])
      end

      def set_breadcrumbs
        @breadcrumbs = [
            {name: 'Главная', link: main_app.admin_path},
            {name: 'События', link: events.admin_courses_path},
            {name: 'Направления', link: events.admin_courses_path}
        ]
      end

    end
  end
end
