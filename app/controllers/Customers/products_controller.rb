class Customers::ProductsController < ApplicationController
	def index
		@categories = Category.all
		@category_id = params[:category_id]
		if @category_id.blank?
			@products = Product.all
		else
			@category = Category.find(@category_id)
		    @products = Product.where(category_id: @category_id)
		end
	end

	def show
		@product = Product.find(params[:id])
		@categories = Category.all
		@cart = CartProduct.new
	end
end
