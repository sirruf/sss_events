module Events
  module Admin
    class CategoriesController < ApplicationController
      # noinspection RailsParamDefResolve,RubyResolve
      before_filter :authenticate_admin! if defined? Devise
      before_action :set_category, only: [:show, :edit, :update, :destroy]
      before_action :set_breadcrumbs, only: [:show, :edit, :new, :index]

      layout 'admin/control'

      def index
        @categories = Category.unscoped.paginate(:page => params[:page], :per_page => 20)
      end

      def new
        # noinspection RubyArgCount
        @category = Category.new
      end

      def show
      end

      def edit
      end

      def create
        @category = Category.new(category_params)

        respond_to do |format|
          if @category.save
            format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
            format.json { render action: 'show', status: :created, location: @course }
          else
            format.html { render action: 'new' }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @category.update(category_params)
            format.html { redirect_to admin_categories_path, notice: 'Category was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: 'edit' }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @category.destroy
        respond_to do |format|
          format.html { redirect_to admin_categories_url }
          format.json { head :no_content }
        end
      end

      private

      def category_params
        params.require(:category).permit( :name )
      end

      def set_category
        @category = Category.unscoped.find(params[:id])
      end

      def set_breadcrumbs
        @breadcrumbs = [
            {name: 'Главная', link: main_app.admin_path},
            {name: 'Категории (События)', link: events.admin_categories_path}
        ]
      end

    end
  end
end
