class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

validates :price, numericality: {greater_than_or_equal_to: 0.01}
validates :title, :uniqueness => { :case_sensitive => false }
validates :image_url, allow_blank: true, format: {
with: %r{\.(gif|jpg|png)$}i,
message: 'must be a URL for GIF, JPG or PNG image.'
}

has_many :line_items

before_destroy :ensure_not_referenced_by_any_line_item

private

def ensure_not_referenced_by_any_line_item
	if line_items.empty?
		return true
	else 
		errors.add(:base, "line items present")
	end
end
end
