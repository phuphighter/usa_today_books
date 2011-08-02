module UsaTodayBooks
  
  class BestSellers
    include HTTParty
    base_uri "http://api.usatoday.com/open/bestsellers/books"
    
    attr_reader :api_key
                
    def initialize(options={})
      @api_key = options[:api_key] || UsaTodayBooks.api_key
    end

    def dates(options={})
      year = options.delete(:year)
      month = options.delete(:month)      
      minyear = options.delete(:minyear)
      maxyear = options.delete(:maxyear)
      
      options = {:minyear => minyear, :maxyear => maxyear}
      
      if year && month
        endpoint = "/dates/#{year}/#{month}"
      elsif year && month.nil?
        endpoint = "/dates/#{year}"
      else
        endpoint = "/dates"
      end
        
      mashup(self.class.get(endpoint, :query => options.merge(self.default_options)))
    end
    
    def booklists(options={}) 
      year = options.delete(:year)
      month = options.delete(:month)     
      date = options.delete(:date)
      
      if year && month && date
        endpoint = "/booklists/#{year}/#{month}/#{date}"
      elsif year && month.nil? && date.nil?
        endpoint = "/booklists/#{year}"
      elsif month && year && date.nil?
        endpoint = "/booklists/#{year}/#{month}"
      else
        endpoint = "/booklists"
      end
        
      mashup(self.class.get(endpoint, :query => options.merge(self.default_options)))
    end
    
    def categories(options={})        
      mashup(self.class.get("/categories", :query => options.merge(self.default_options)))
    end
    
    def classes(options={})        
      mashup(self.class.get("/classes", :query => options.merge(self.default_options)))
    end
    
    def titles(options={})        
      title = options.delete(:title)
      isbn = options.delete(:isbn)
      
      if title
        endpoint = "/titles/#{title}"
      elsif isbn
        endpoint = "/titles/#{isbn}"
      else
        endpoint = "/titles"
      end
      
      mashup(self.class.get(endpoint, :query => options.merge(self.default_options)))
    end
    
    protected
    
    def default_options
      { :api_key => @api_key, :encoding => "json" }
    end
    
    def mashup(response)
      case response.code
      when 200
        if response.is_a?(Hash)
          Hashie::Mash.new(response)
        else
          if response.first.is_a?(Hash)
            response.map{|item| Hashie::Mash.new(item)}
          else
            response
          end
        end
      end
    end
  end
end
