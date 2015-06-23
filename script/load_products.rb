Products.transaction do
	(20..22).each do |i|
		Products.create(:name => "Product example#{i}", :detail => "sample",  :price => 1.0)
	end
end