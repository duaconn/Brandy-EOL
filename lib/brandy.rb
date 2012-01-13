require "brandy/version"
require "brandy/action_view"

module Brandy
  class << self
    attr_accessor :brands

    def load_file
      @brands = YAML::load_file 'config/branding.yml'
    end

    def prefix request
      if request.domain.split('.').last.nil?
        @brands.first
      else
        @brands[request.domain.split('.').last] ||= @brands.first
      end
    end

  end  
  load_file
end

