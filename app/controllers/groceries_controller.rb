class GroceriesController < ApplicationController

  def index
    @all_items = Grocery.all
    authorize @all_items
  end

  def show
    @item = Grocery.find(params[:id])
    authorize @item
  end

  def new
    @item = Grocery.new
    authorize @item
  end

  def edit
    @item = Grocery.find(params[:id])
    authorize @item
  end

  def create
    @item = Grocery.new(grocery_params)
    authorize @item
    if @item.save
      flash[:success] = "Grocery Item Added!"
      redirect_to @item
    else
      render "new"
    end
  end

  def update
    @item = Grocery.find(params[:id])
    if @item.update_attributes(grocery_params)
      flash[:success] = "Grocery Item Updated!"
      redirect_to @item
    else
      render "edit"
    end
  end

  private

    def grocery_params
      params.require(:grocery).permit(:item, :quantity)
    end
end
