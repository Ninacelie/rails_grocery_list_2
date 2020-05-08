class ItemsController < ApplicationController 

  def index
    if params[:list_id] && @list = List.find_by_id(params[:list_id]) 
      @items = @list.items
    else 
      @items = Item.all 
    end 
  end 

  def new
    @item = Item.new 
  end 

  def create
    @item = current_user.items.build(item_params)
    if @item.save 
      redirect_to items_path 
    else 
      render :new 
    end 
  end 
  
  def show 
    @item = Item.find_by(id: params[:id])
  end 

  def edit 
    @item = Item.find_by(id: params[:id])
  end

  def completed
    @completed_items = ListItem.complete_items
    render :index 
  end 
end 