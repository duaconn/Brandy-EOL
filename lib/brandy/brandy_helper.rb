module BrandyHelper

  # branded_image_tag 'image'
  # nexia/image
  #
  # branded_image_tag '/image'
  # nexia/image
  
  # branded_image_tag 'intro'
  # /images

  def branded_image_tag(source, options = {})
    image_tag(File.join(Brandy.prefix(request), source), options)
  end

  def branded_stylesheet_link_tag(*sources)
    options = sources.extract_options!
    sources.map!{ |source| File.join(Brandy.prefix(request), source) }
    sources << options
    stylesheet_link_tag *sources
  end

  # def branded_image_path(source)
  #   "/" + Brandy.prefix(request) + compute_public_path(source, 'images')
  # end
  # alias_method :path_to_image, :image_path # aliased to avoid conflicts with an image_path named route

  # def branded_stylesheet_path(source)
  #  "/" + Brandy.prefix(request) + compute_public_path(source, 'stylesheets', 'css')
  # end
  # alias_method :path_to_stylesheet, :stylesheet_path      

end
include BrandyHelper
