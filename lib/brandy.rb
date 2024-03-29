require "brandy/version"
require "brandy/brandy_helper"

module Brandy
  class << self
    #used to return a value from YAML file. Brandy.<string_to_return>({:request => request})
    #TODO: Load brand filtering options based on files in filters directory
    def method_missing(name, args = {})
      #name - key in yaml file to load (eg system, system_plain, domain)
      #args - hash of filters to use, evaluated in order. Options are independent of order (NYI)
      
      if args.has_key?(:country_code)
        brand = brand_from_country_code args[:country_code]
      elsif args.has_key?(:account)
        brand = brand_from_country_code args[:account].country_code
      elsif args.has_key?(:request)
        brand = brand_from_request args[:request]
      else
        #TODO: Fix this, obviously
        brand = config['domains']['default']
      end
       
      get_property(brand,name)
    end
   
    def get_property(brand, property)
     config['brands'][brand.to_s][property.to_s]
    end
    
    def brand_from_country_code country_code
      config['domains'][country_code.downcase] || config['domains']['default'] || 'default'
    end
    
    def tld request
      request && request.domain && request.domain.split('.').last || "default" 
    end
    
    def brand_from_request request
      config['domains'][tld(request)] || config['domains']['default']
    end
    
    def prefix request
      #config['domains'][tld(request)] || config['domains']['com'] || 'nexia'
      
      brand = config['domains'][tld(request)] || config['domains']['default']
      asset_group = brand.split('_').first
      asset_group
    end
    
    def config
      @config ||= YAML.load(ERB.new(File.read(Rails.root.join('config', 'branding.yml'))).result)
    end
  end
end

