require "brandy/version"
require "brandy/brandy_helper"

module Brandy
  class << self
    def prefix request
      if Module.const_defined? 'Branding'
        Branding.config['domains'][Branding.tld(request)] || Branding.config['domains']['com'] || 'nexia'
      else
        'nexia'
      end
    end
  end
end

