Spree::CheckoutController.class_eval do
  before_action :ensure_minimum_spend_met

  def ensure_minimum_spend_met
    unless @order.minimum_spend_met?
      flash[:error] =
        I18n.t(:minimum_spend, minimum_money: @order.minimum_money, scope: :wholesale)
      redirect_to spree.cart_path
    end
  end
end
