class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :item_find,only: [:show,:edit,:update,:destroy]
  before_action :item_root,only: [:edit,:destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path,success:'編集に成功しました'
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
     


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :cost_id, :prefecture_id, :days_id,:price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
  
  def item_root
    unless @item.user.id == current_user.id
      redirect_to user_session_path
    end
  end

end
