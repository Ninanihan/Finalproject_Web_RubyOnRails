class OrdersController < ApplicationController

def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

def create
  @order = Order.new(order_params)
  @product = Product.find(params[:product_id])
  @order = @product.orders.create(order_params)
  @order.user_id = current_user.id
  @amount = @product.price

    require "stripe"
    Stripe.api_key = "sk_test_I3ZXD4Q593wFg07APZ1gUA3h"
    token = params[:stripeToken]

    begin
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :amount => @amount,
        :currency => "eur", 
        :customer => customer.id,
        :card => token
        )
      flash[:notice] = "Thanks for order!"

    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end
  if @order.save
    redirect_to product_path(@product)
    flash[:notice] = "You have bought a dog!"
  else
    flash.now[:danger] = "error"
  end
end



private
    def order_params
      params.require(:order).permit(:name, :address, :phone_number, :user_id, :product_id)
    end
end
