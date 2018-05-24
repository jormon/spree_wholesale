class AddWholesaleOnlyToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :wholesale_only, :boolean,
      default: false, null: false
  end
end
