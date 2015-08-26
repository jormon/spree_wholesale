Spree::SubscriptionsHelper.module_eval do
  def subscription_price_difference_for(product:)
    if product.wholesale_subscribable? && spree_current_user.try(:wholesaler?)
      Spree::Money.new \
        product.wholesale_price - product.wholesale_subscription_price
    else
      Spree::Money.new product.price - product.subscribed_price
    end
  end
end
