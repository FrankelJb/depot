require 'test_helper'

class CartTest < ActiveSupport::TestCase

	test "adding unique products to carts" do
		cart = carts(:one)
		[:ruby, :one].each do |product_name|
			line_item = cart.add_product products(product_name).id
			line_item.save!
		end
		
		assert_equal cart.line_items.size, 2
		cart.line_items.each do |line_item|
			assert_equal line_item.quantity, 1
		end
	end

	test "adding duplicate products to carts" do
		cart = carts(:one)
		2.times do
			line_item = cart.add_product products(:ruby).id
			line_item.save!
		end
		
		assert_equal cart.line_items.size, 1
		cart.line_items.each do |line_item|
			assert_equal line_item.quantity, 2
		end
	end
end
