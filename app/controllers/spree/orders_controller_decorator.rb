Spree::OrdersController.class_eval do
  def subscribed_price_for_variant_override(variant)
    if spree_current_user.try(:wholesaler?) && variant.wholesale_subscribable?
      variant.wholesale_subscription_price
    else
      variant.subscribed_price
    end
  end
end
