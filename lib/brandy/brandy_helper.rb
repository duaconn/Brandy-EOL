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
 

end
include BrandyHelper
