class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	get_visit_count
  end

  private 

  	def get_visit_count
  		if session[:counter].nil?
  			session[:counter] = 1
  		else
  			session[:counter] += 1
  		end
		end
end
