class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @categories = Category.all
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search])
    else
      @products = Product.all
    end
    if params[:category_search]
      @products = Product.search(params[:category_search])
    else
      @products = Product.all
    end
  end
end
