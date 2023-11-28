class CategoryProduct < ApplicationRecord
  belongs_to :product
  belonts_to :category
end
