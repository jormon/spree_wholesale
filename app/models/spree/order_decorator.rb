Spree::Order.class_eval do
  MINIMUM_ITEM_TOTAL ||= 100.00

  # override this, don't let the button show up if they have less
  def minimum_spend_met?
    !(user.try(:wholesaler?) && item_total.to_f < MINIMUM_ITEM_TOTAL)
  end

  def minimum_money
    Spree::Money.new MINIMUM_ITEM_TOTAL
  end
end
