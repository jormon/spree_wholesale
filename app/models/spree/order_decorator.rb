Spree::Order.class_eval do
  MINIMUM_ITEM_TOTAL ||= 100.00

  # returns a boolean indicating if this order contains items priced at
  # wholesale prices.  NB: this relies on line item pricing not changing
  # between when the order was confirmed and when it was measured as wholesale.
  def wholesale?
    line_items.any? do |line_item|
      product = line_item.product
      # a product could have multiple wholesale prices
      [
        product.wholesale_price,
        product.wholesale_subscription_price
      ].include? line_item.price
    end
  end

  # override this, don't let the button show up if they have less
  def minimum_spend_met?
    !(user.try(:wholesaler?) && item_total.to_f < MINIMUM_ITEM_TOTAL)
  end

  def minimum_money
    Spree::Money.new MINIMUM_ITEM_TOTAL
  end
end
