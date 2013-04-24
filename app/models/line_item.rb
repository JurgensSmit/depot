class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  # attr_accessible :title, :body
end
