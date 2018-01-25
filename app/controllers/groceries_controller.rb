class GroceriesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Grocery.all
  end

  def show
    @item = Grocery.find(params[:id])
  end

  def new
    @item = Grocery.new
  end

  def create
    @item = Grocery.new(grocery_params)
    if @item.save
      redirect_to @item
    else
      render "new"
    end
  end

  private

    def grocery_params
      params.require(:grocery).permit(:item, :quantity)
    end
end
