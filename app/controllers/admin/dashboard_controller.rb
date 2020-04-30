class Admin::DashboardController < ApplicationController
  before_filter :authorize

  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
end
