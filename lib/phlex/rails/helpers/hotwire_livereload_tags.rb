module Phlex
  module Rails
    module Helpers
      module HotwireLivereloadTags
        extend Phlex::Rails::HelperMacros

        # @!method hotwire_livereload_tags
        #   Outputs meta tags necessary to enable Hotwire livereloading.
        #   @return [nil]
        define_output_helper :hotwire_livereload_tags
      end
    end
  end
end
