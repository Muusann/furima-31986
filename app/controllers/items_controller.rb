class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :params_find, only: [:destroy, :show]
  def index
    @item = Item.order('created_at DESC' )
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def edit
    #@item = Item.find(params[:id])
  #end
  
  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  def show
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :category_id, :condition_id, :description, :price, :delivery_date_id, :delivery_fee_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def params_find
    @item = Item.find(params[:id])
  end
end
