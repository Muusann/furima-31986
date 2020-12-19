class PurchasController < ApplicationController

  def index
   @address_purcha = PurchaAddress.new
   @item = Item.find(params[:item_id])
  end

  def create
    @address_purcha = PurchaAddress.new(purcha_params)
    if @address_purcha.valid?
      @address_purcha.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

private

  def purcha_params
    params.require(:purcha_address).permit(:name, :nickname, :purcha_id, :post_code, :phone_number, :prefecture_id, :address_number, :municipalities, :building ).merge(user_id:current_user.id,item_id: params[:item_id])
  end

end