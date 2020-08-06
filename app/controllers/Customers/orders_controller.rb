class Customers::OrdersController < ApplicationController
	def index
		@customer = current_customer
		@orders = @customer.orders.page(params[:page])
	end

	def show
        @customer = current_customer
        @order = Order.find(params[:id])
        @total_price = @order.price + @order.freight
        @product_orders = ProductOrder.where(params[:@order])
	end

	def new
	    @customer = current_customer
	    @order = Order.new
	end

	def create
		@order = Order.new(params[:Order])
	 end

	def confirm
		@order = Order.new(order_params)
		@cart_products = current_customer.cart_products
		byebug
		@total_price = 0
		@cart_products.each do |cart_product|
			@total_price += cart_product.product.price * cart_product.quantity
		end
	end

	def thanks
	end

	private
	def order_params
		params.require(:order).permit(:customer_id, :name, :postal_code, :address, :how_to_pay, :status, :price)
	end
	def cart_product_params
		params.require(:cart_product).permit(:product_id, :quantity, :customer_id)
	end
end