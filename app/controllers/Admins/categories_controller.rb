class Admins::CategoriesController < ApplicationController
	def index
		@categories = Category.all
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category != nil
			@category.save
			redirect_to request.referer
		else
			render :index
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		category = Category.find(params[:id])
		category.update(category_params)
		redirect_to admins_categories_path
	end

	def destroy
		category = Category.find(params[:id])
		category.destroy
		redirect_to admins_categories_path
	end

private
	def category_params
		params.require(:category).permit(:name, :valid_flag)
	end

end
