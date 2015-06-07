class Wishlist < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		current_item = line_items.find_by_product_id(product_id) # ActiveRecord module
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(:product_id => product_id)
		end
		current_item		
	end

	def minus_product(product_id)
		current_item = line_items.find_by_product_id(product_id) # ActiveRecord module
		if current_item
			if current_item.quantity > 1
				current_item.quantity -= 1
				return current_item
			else
				current_item.destroy
			end
		return nil
		end
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end
