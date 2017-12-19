class GroceriesController < ApplicationController
  def new
    @item = Grocery.new
  end

  def create
  end
end
