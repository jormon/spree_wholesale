Spree::OrdersController.class_eval do
  after_filter :wholesale_adjustments, only: :populate, if: :wholesale_active?

  protected

  def wholesale_active?
    spree_current_user.try(:wholesaler?) &&
      !subscriptions_active?
  end

  def wholesale_adjustments
    if params[:product_id]
      adjust_line_item_with params[:product_id]
    end

    if params[:variant_id]
      adjust_line_item_with params[:variant_id]
    end

    params[:products].each do |product_id,variant_id|
      adjust_line_item_with variant_id
    end if params[:products]

    params[:variants].each do |variant_id, quantity|
      adjust_line_item_with variant_id
    end if params[:variants]

    current_order.updater.update
  end

  def adjust_line_item_with(variant_id)
    line_item = current_order.line_items.where(:variant_id => variant_id).first

    if line_item.product.wholesaleable? &&
         line_item.variant.wholesale_price.present?
      line_item.price = line_item.variant.wholesale_price
      line_item.save
    end

    # for good measure...
    true
  end

  def subscribed_price_for_variant_override(variant)
    if spree_current_user.try(:wholesaler?) && variant.wholesale_subscribable?
      variant.wholesale_subscription_price
    else
      variant.subscribed_price
    end
  end
end
