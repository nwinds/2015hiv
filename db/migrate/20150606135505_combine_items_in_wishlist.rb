class CombineItemsInWishlist < ActiveRecord::Migration
  def self.up
  	# replace mutiple items for a single product in a wishlist with a single item
  	Wishlist.all.each do |wishlist|
  		# count the number of each product in the wishlist
  		sums = wishlist.line_items.group(:product_id).sum(:quantity)
  		sums.each do |product_id, quantity|
  			if quantity > 1
  				# remove individule item
  				wishlist.line_items.where(:product_id => product_id).delete_all
  				# replace wit a single item
  				wishlist.line_items.create(:product_id => product_id, :quantity => quantity)
  			end
  		end
  	end
  end

# make the rolling back able to roll back
	def self.down
		# split items with quantity>1 into multiple items
		LineItem.where("quantity>1").each do |line_item|
			# add individule items
			line_item.quantity.times do
				LineItem.create :wishlist_id => line_item.wishlist_id,
								:product_id => line_item.product_id,
								:quantity => 1
			end
			
			# remove original items
			line_item.destroy
		end
	end
  		
end
