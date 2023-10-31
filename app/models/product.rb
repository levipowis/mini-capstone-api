class Product < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true, numericality: { only_numeric: true, greater_than: 0 }
  validates :description, length: { in: 10..500 }
  validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i,
                                  :message => "must have a valid file type", multiline: true

  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09
    return tax
  end

  def total
    tax = price * 0.09
    total = price + tax
    return total
  end
end
