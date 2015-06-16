require 'carrierwave/orm/activerecord'
require 'zxing/decodable'

class Product < ActiveRecord::Base
  include Decodable
  default_scope { order('name') }

  has_one :file_manager, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :line_items, dependent: :destroy
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, :presence => true,
  				   :uniqueness => true
  validates :detail, :presence => true
  validates :price, :presence => true,
          :numericality => {:greater_than_or_equal_to => 0.01}
  mount_uploader :avatar, AvatarUploader
  validate :avatar_size_validation

  # simple search by name
  # try to expant into multiple search on next roll
  def self.search(query, page)
  	order('created_at DESC').where('name LIKE ?', "%#{query}%").paginate(page: page, per_page: 10)
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


  def avatar_size_validation
    errors[:avatar] << "should be less than 0.5MB" if avatar.size > 0.5.megabytes
  end
end