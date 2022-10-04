class PurchasesController < ApplicationController
  
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if @item.user.id == current_user.id || @item.purchase != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
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
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
  end

  


end