class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
   
  end

  def update
    @order = Order.find(params[:id])
    order.update(order_params)
  end

  private

  def order_params
    params.permit(:user, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone,
                                          :order).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  
end
