class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']


  def show
   @product_num = Product.all.count()
   @category_num = Category.all.count()
  end
end
