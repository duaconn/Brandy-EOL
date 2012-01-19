require "brandy/version"
require "brandy/brandy_helper"
require "branding"

module Brandy
  class << self
    def prefix request
      Branding.config['domains'][Branding.tld(request)] || Branding.config['domains']['com'] || 'nexia'
    end
  end  
end

