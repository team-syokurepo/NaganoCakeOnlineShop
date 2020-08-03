class Customers::CartProductsController < ApplicationController
	def index
		@cart_products = CartProduct.all
		# @cart_product = @cart_products.product
	end

	def create
		
	end

	def destroy
		cart_product = CartProduct.find(params[:id])
		cart_product.destroy
		redirect_to request.referer

	end

	def update
		cart_product = CartProduct.find(params[:product_id])
		cart_product.update(cart_product_params)
		redirect_to request.referer
	end

	

	def empty
		CartProduct.destroy_all
		redirect_to request.referer
	end
private
def cart_product_params
	params.require(:cart_product).permit(:cart_products.product)
end
end
