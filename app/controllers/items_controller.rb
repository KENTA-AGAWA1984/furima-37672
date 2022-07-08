class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_items,          only: [:show, :edit, :update]
  before_action :producer_confirmation, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end  
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :category_id, :condition_id, :postage_type_id, :prefecture_id,
                                 :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end  

  def producer_confirmation  
      unless @item.user_id == current_user.id
        redirect_to root_path 
      end
  end

end
