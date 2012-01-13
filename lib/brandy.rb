require "brandy/version"
require "brandy/action_view"

module Brandy
  class << self
    attr_accessor :brands

    def load_file
      @brands = YAML::load_file 'config/branding.yml'
    end

    def prefix request
      @brands[request.domain.split('.').last]
    end

  end  
  load_file
end

