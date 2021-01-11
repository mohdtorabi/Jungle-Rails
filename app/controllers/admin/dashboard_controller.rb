class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "yoyo", password: "secret"
  before_filter :authorize
  def show
    @products = Product.all
    @category = Category.all
  end
end
