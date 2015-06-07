class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :wishlist

	def total_price
		product.price * quantity
	end

	def add_quantity
		quantity += 1		
	end

	def minus_quantity
		if quantity >= 1
			quantity -= 1	
		else
			logger.error "LineItem.quantity = 0 now, cannot decrease."
		end
	end
end
