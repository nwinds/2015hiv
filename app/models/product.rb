class Product < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  default_scope { order('name') }
  validates :name, :presence => true,
  				   :uniqueness => true
  validates :detail, :presence => true
  validates :icon_url, :presence => true,
					   :format => {:with => %r{\.(gif|jpe?g|png)\z}i, :message => "must be a URL for GIF, JPG/JPEG or png image.'" }
  validates :price, :presence => true,
					:numericality => {:greater_than_or_equal_to => 0.01}
end