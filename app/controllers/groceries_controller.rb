class GroceriesController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @groceries = Grocery.paginate(page: params[:page])
  end

  def show
  end

  def new
    @item = current_user.groceries.build if user_signed_in?
    authorize @item
  end

  def edit
  end

  def create
    @item = current_user.groceries.build(grocery_params)
    authorize @item
    if @item.save
      flash[:success] = "Your Item Has Been Added!"
      redirect_to @item
    else
      render "new"
    end
  end

  def update
    if @item.update(grocery_params)
      flash[:success] = "Your Item Has Been Updated!"
      redirect_to @item
    else
      render "edit"
    end
  end

  def destroy
    @item.destroy
    flash[:success] = "The Item Has Been Removed."
    redirect_to groceries_path
  end

  private

    def grocery_params
      params.require(:grocery).permit(:item, :quantity)
    end

    def set_item
      @item = Grocery.find(params[:id])
      authorize @item
    end
end
