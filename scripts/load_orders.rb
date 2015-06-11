# load_orders.rb
# to generate 100 order on product 
Order.transaction do
	(1..100).each do |i|
		Order.create(:name => "Guest #{i}", :email => 'guest_#{i}@example.com')
	end
end
