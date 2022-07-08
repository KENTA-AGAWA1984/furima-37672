class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :Producer_confirmation, only: [:edit, :update, :destroy]

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
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
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

  def Producer_confirmation
      @item = Item.find(params[:id])
      unless @item.user_id == current_user.id
        redirect_to root_path 
      end
  end

end
