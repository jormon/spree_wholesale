module Spree
  ProductsController.class_eval do
    # redefine this to also allow wholesale items for wholesale users
    def load_product
      if try_spree_current_user.try(:has_spree_role?, "admin")
        @products = Product.with_deleted
      elsif try_spree_current_user.try(:has_spree_role?, "wholesale")
        @products = Product.active_and_wholesale
      else
        # current_currency is unused
        @products = Product.active(current_currency).
          where(wholesale_only: false)
      end
      @product = @products.friendly.find(params[:id])
    end
  end
end
