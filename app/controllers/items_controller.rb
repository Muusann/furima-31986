class ItemsController < ApplicationController
  def index
    @item = Item.all
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

  private

  def items_params
    params.require(:items).permit(:image, :name, :category_id, :condition_id, :description, :price, :delivery_date_id, :delivery_fee_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
