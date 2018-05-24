module Spree
  TaxonsController.class_eval do
    # redefine this to also allow wholesale items for wholesale users
    def show
      @taxon = Taxon.find_by_permalink!(params[:id])
      return unless @taxon

      new_params = {
        taxon: @taxon.id,
        include_images: true,
        search: { active_wholesaler: spree_current_user.try(:wholesaler?) },
      }

      @searcher = build_searcher params.merge new_params
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
