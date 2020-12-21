class PurchasController < ApplicationController
  before_action :authenticate_user! 
  before_action :item
  before_action :path_restriction


  
  def index
   @address_purcha = PurchaAddress.new
  end

  def create
   
    @address_purcha = PurchaAddress.new(purcha_params)
    if @address_purcha.valid?
      pay
      @address_purcha.save
      redirect_to root_path action: :index
    else
      render action: :index
    end
  end

private

  def purcha_params
    params.require(:purcha_address).permit(:post_code, :purchas_id,:phone_number, :prefecture_id, :address_number, :municipalities, :building ).merge(user_id:current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def item
    @item = Item.find(params[:item_id])
  end

  def path_restriction
    # ログイン済みのユーザーと出品者が一致
    if current_user.id == @item.user.id || @item.purcha != nil
      redirect_to root_path
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purcha_params[:token],
      currency: 'jpy'
    )
  end
end