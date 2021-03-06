class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  has_many :discounts, through: :item

  def subtotal
    (quantity * price) - discount
  end

  def discount
    Discount.item_discount(item_id, item.price, quantity)
  end

  def fulfill
    update(fulfilled: true)
    item.update(inventory: item.inventory - quantity)
  end

  def fulfillable?
    item.inventory >= quantity
  end
end
