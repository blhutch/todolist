class ItemController < ApplicationController

  def new
    @item = Item.new(:list_id => params[:list_id])
  end

  def create
     @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Your item has been saved."
    redirect_to @item.list
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item removed"
    redirect_to @item.list
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
     flash[:notice] = "Item updated"
     redirect_to @item
    else
      render :edit
    end
  end

end
