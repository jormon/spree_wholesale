class AddWholesaleableToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :wholesaleable, :boolean,
      default: false, null: false
  end
end
