class Product < ActiveRecord::Base
  default_scope { order('name') }
  has_many :comments, dependent: :destroy
  has_many :line_items, dependent: :destroy
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, :presence => true,
  				   :uniqueness => true
  validates :detail, :presence => true
  validates :icon_url, :presence => true,
					   :format => {:with => %r{\.(gif|jpe?g|png)\z}i, :message => "must be a URL for GIF, JPG/JPEG or png image.'" }
  validates :price, :presence => true,
					:numericality => {:greater_than_or_equal_to => 0.01}


  # simple search by name
  # try to expant into multiple search on next roll
  def self.search(query)
    where("name like ?", "%#{query}%") 
  end

private
	# hook method
	# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true			
		else
			errors.add(:base, "Line Items present")
			return false
		end		
	end
end