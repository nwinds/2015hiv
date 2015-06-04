require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
  	product = Product.new
    assert product.invalid?, "product new is valid!"
    assert product.errors[:name].any?
    assert product.errors[:detail].any?
    assert product.errors[:price].any?
    assert product.errors[:icon_url].any?
  end

  test "product price must be positive" do
  	product = Product.new(:name => 'My book Name',
					  	  :detail => 'ddd',
					  	  :icon_url => 'ii.jpg',
                :price => 1)
  	product.price = -1
    assert(product.invalid?, "must be greater than or equal to 0.01")
	
	product.price = 0
    assert(product.invalid?, "must be greater than or equal to 0.01")

	product.price = 1
    assert product.valid?
  end

  def new_product(icon_url)
  	Product.new(:name => 'My book Name',
				:detail => '111',
				:price => 1,
				:icon_url => icon_url)  	
  end

  test 'icon url' do
  	ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
		  	http://a.b.c/x/y/z/fred.gif}
	bad = %w{fred.doc fred.gif/more fred.gif.more}
	ok.each do |name|
		assert new_product(name).valid?, "#{name} shouldn't be invalid"
	end

	bad.each do |name|
		assert new_product(name).invalid?, "#{name} shouldn't be valid"
	end
  end

  test "product is not valid without a unique name" do
  	product = Product.new(:name => products(:ruby).name,
					  	  :detail => 'ddd',
					  	  :price => 1.0,
					  	  :icon_url => 'ii.jpg')
    assert(!product.save, "has already been taken")
  end  

  test "product is not valid without a unique name - i18n" do
  	product = Product.new(:name => products(:two).name,
					  	  :detail => 'ddd',
					  	  :price => 1.0,
					  	  :icon_url => 'fred.jpg')
    assert !product.save
    assert_equal I18n.translate("errors.messages.taken"), product.errors[:name].join('; ')
  end  
end
