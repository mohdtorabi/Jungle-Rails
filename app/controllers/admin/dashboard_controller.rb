class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "moho", password: "secret", only: :show

  def show
  end
end
