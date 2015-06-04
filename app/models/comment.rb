class Comment < ActiveRecord::Base
	belongs_to :product 
	default_scope { order('commenter') }
	validates :commenter, :presence => true
	
	# body : 15 <= string len  <= 200
	validates :body, :presence => true
	validates_length_of :body, :minimum => 15, :maximum => 200

	# for check
	validate :product_id_exists

private
	def product_id_exists
		begin
		Product.find(self.product_id)
		rescue ActiveRecord::RecordNotFound
			errors.add(:product_id, "product_id foreign key must exist")
			false
		end
	end
end
