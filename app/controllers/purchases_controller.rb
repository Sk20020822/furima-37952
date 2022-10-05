class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :set_item,only: [:index,:create]
  before_action :prevent_url,only: [:index]
  
  
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :home_num, :building_name, :tel).merge(token: params[:token],user_id: current_user.id, item_id: @item.id)
    
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user.id == current_user.id || @item.purchase != nil
    redirect_to root_path
   end
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
  end

  


end