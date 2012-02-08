require "brandy/version"
require "brandy/brandy_helper"

module Brandy
  class << self
    attr_accessor :config
    #used to return a value from YAML file. Brandy.<string_to_return>({:request => request})
    #TODO: Load brand filtering options based on files in filters directory
    def method_missing(name, *args)
      #name - key in yaml file to load (eg system, system_plain, domain)
      #args - hash of filters to use, evaluated in order. Options are independent of order (NYI)
      
      #hack method to load yaml if it hasn't been yet
      if @config.nil? then @config = YAML.load_file(Rails.root.join("config","branding.yml")) 
      
       if (!args[:country_code].nil?)
         brand = brand_from_country_code
       elsif (!args[:session].nil?)
         brand = brand_from_session
       else
         #TODO: Fix this, obviously
         brand = 'nexia'
       end
       
       get_property(brand,name)
       
    end
   
    def get_property(brand, property)
     @config['brands'][brand][property]
     
    end
    
    def brand_from_country_code country_code
      @config['domains'][country_code.downcase] || @config['domains']['com']
    end
        
    def prefix request
      if Module.const_defined? 'Branding'
        Branding.config['domains'][Branding.tld(request)] || Branding.config['domains']['com'] || 'nexia'
      else
        'nexia'
      end
    end
  end
end

