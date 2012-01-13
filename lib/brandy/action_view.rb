module ActionView
  module Helpers
    module AssetTagHelper
      
      def image_path(source)
        "/" + Brandy.prefix(request) + compute_public_path(source, 'images')
      end
      alias_method :path_to_image, :image_path # aliased to avoid conflicts with an image_path named route
      
      def stylesheet_path(source)
        compute_public_path(source, 'stylesheets', 'css')
      end
      alias_method :path_to_stylesheet, :stylesheet_path
      
    end
  end
end
