class DashboardController < ApplicationController
	before_action :admin_user, only: [:index] 
	def index
		@orders = Order.all
		@users = User.all
		@products = Product.all
		@categories = Category.all
	end
	private
	def admin_user
      redirect_to(store_url) unless current_user.admin?
    end
end
