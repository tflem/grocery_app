class GroceriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]

  def index
    @all_items = Grocery.all
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
      flash[:success] = "Grocery Item Added!"
      redirect_to groceries_path
    else
      render "new"
    end
  end

  private

    def grocery_params
      params.require(:grocery).permit(:item, :quantity)
    end
end
