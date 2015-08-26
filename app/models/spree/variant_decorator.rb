Spree::Variant.class_eval do
  delegate :wholesaleable?, :to => :product
  delegate :wholesale_subscribable?, :to => :product
end
