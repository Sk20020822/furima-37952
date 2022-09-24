class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :correct_post,only: [:edit]
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path,success:'編集に成功しました'
    else
      render :new
    end
  end
     


  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :cost_id, :prefecture_id, :days_id,:price).merge(user_id: current_user.id)
  end

  def correct_post
    @item = Item.find(params[:id])
     unless @item.user.id == current_user.id
      redirect_to user_session_path
    end
  end
  
  
end
