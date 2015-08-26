Spree::User.class_eval do
  def wholesaler?
    has_spree_role? :wholesale
  end
end
