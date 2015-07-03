class ListController < ApplicationController

  def index
    @list = List.all
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new(:list_id => params[:id])

  def new
    @list = List.new(:name => params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Your list has been saved."
    redirect_to @list
    else
     render :new
    end
  end

  def update
     @list = List.find(params[:id])
    if @list.update(list_params)
     flash[:notice] = "list updated"
     redirect_to @list
    else
      render :edit
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def delete
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "list deleted"
    redirect_to lists_path
  end

end