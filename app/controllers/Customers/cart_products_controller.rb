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
		cart_product = order.
		CartProduct.destroy_all
		redirect_to request.referer
	end

private

def current_cart
	# current_cart = CartProduct.find_by(id: session[cart_product_id])
	# current_cart = CartProduct.create unless current_cart
	# session[:cart_product_id] = current_cart.id
	# current_cart
	if session[:cart_product_id]
		cart_product = Cart.find(session[:cart_product_id])
end



def cart_product_params
	params.require(:cart_product).permit(:cart_products.product)
end
end
