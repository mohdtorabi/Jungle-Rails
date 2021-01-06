class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "yoyo", password: "secret"

  def show
    @products = Product.all
    @category = Category.all
  end
end
