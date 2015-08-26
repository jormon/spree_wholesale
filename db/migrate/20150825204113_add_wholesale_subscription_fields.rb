class AddWholesaleSubscriptionFields < ActiveRecord::Migration
  def change
    add_column :spree_products, :wholesale_subscribable, :boolean, default: false
    add_column :spree_variants, \
      :wholesale_subscription_price,
      :decimal,
      precision: 8,
      scale: 2
  end
end
