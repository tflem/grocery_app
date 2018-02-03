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

  def edit
    @item = Grocery.find(params[:id])
  end

  def create
    @item = Grocery.new(grocery_params)
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
