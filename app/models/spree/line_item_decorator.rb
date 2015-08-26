Spree::LineItem.class_eval do
  # take the variant's wholesale price if the order is being placed by a
  # wholesaler.  also, monkey patch rails
  alias_method :original_copy_price, :copy_price
  def copy_price
    if product.wholesaleable? && order.user.try(:wholesaler?)
      # only set the price if it hasn't already been set
      self.price = variant.wholesale_price if price.nil?
    else
      original_copy_price
    end
  end
end
