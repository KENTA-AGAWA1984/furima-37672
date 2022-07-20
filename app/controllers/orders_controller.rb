class OrdersController < ApplicationController
  before_action :set_item,           only: [:index, :create]
  before_action :redirect_session,   only: [:index, :create]
  before_action :prevent_url,        only: [:index, :create]
      
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
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
    params.require(:order_address).permit(:user, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone,
                                          :order).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def prevent_url
    unless user_signed_in? && (current_user == @item.user)
      redirect_to root_path
    end
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def redirect_session
    redirect_to user_session_path unless user_signed_in?
  end
end
