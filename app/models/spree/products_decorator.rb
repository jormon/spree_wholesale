Spree::Product.class_eval do
  delegate_belongs_to :master, :wholesale_price, :wholesale_subscription_price

  # use this on taxon pages to hide non-wholesale products
  def self.active_wholesaler(is_wholesaler = false)
    if is_wholesaler
      active
    else
      t = arel_table
      sql = t[:available_on].lteq(Time.now).and(t[:wholesale_only].not_eq(true))
      not_deleted.joins(master: :prices).where(sql)
    end
  end
  search_scopes << :active_wholesaler
end
