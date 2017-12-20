class GroceriesController < ApplicationController

  def show
    @item = Grocery.find(params[:id])
  end

  def new
    @item = Grocery.new
  end

  def create
    @item = Grocery.new(grocery_params)
    @item.save
    redirect_to @item
  end

  private

    def grocery_params
      params.require(:grocery).permit(:item, :quantity)
    end
end
