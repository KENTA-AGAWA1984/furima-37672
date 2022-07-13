class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:user, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone,
                                          :order).merge(user_id: current_user.id)
  end
end
