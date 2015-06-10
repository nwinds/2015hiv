class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy

	def add_line_items_from_wishlist(wishlist)
		wishlist.line_items.each do |item|
			item.wishlist_id = nil # in case user's wishlist 'vanished'
			line_items << item
		end
	end
			
		
end
