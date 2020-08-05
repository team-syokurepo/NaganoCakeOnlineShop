class Customers::OrdersController < ApplicationController
	def index
		@customer = current_customer
		@orders = @customer.orders
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
		@order = Order.new
	end

	def thanks
	end

	private
	def order_params
		params.require(:customer).permit(:customers_id, :name, :postal_code, :address)
	end
end