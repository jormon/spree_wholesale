Spree::SubscriptionsHelper.module_eval do
  def subscription_price_difference_for(variant:)
    if variant.wholesale_subscribable? && spree_current_user.try(:wholesaler?)
      Spree::Money.new \
        variant.wholesale_price - variant.wholesale_subscription_price
    else
      Spree::Money.new variant.price - variant.subscribed_price
    end
  end
end
