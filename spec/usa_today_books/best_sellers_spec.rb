require 'spec_helper'

describe UsaTodayBooks::BestSellers do
  
  context '#dates' do    
    use_vcr_cassette 'dates'
    
    it 'should initialize with an api_key' do
      @client = UsaTodayBooks::BestSellers.new(:api_key => "foobar")
      @client.api_key.should == "foobar"
    end
    
    it 'should request dates' do    
      
      @client = UsaTodayBooks::BestSellers.new(:api_key => "foobar")
      @books = @client.dates()
      @books["BookListDates"].first["BookListAPIUrl"].should == "BookLists/2011/7/28"
    end    

    it 'should request dates with params' do                
      @client = UsaTodayBooks::BestSellers.new(:api_key => "foobar")
      @books = @client.dates(:minyear => 2009, :maxyear => 2010)
      @books["BookListDates"].first["BookListAPIUrl"].should == "BookLists/2010/12/30"
    end
        
    it 'should request dates with params' do                
      @client = UsaTodayBooks::BestSellers.new(:api_key => "foobar")
      @books = @client.dates(:year => 2008)
      @books["BookListDates"].first["BookListAPIUrl"].should == "BookLists/2008/12/25"
    end
  end
  
  context '#booklists' do    
    use_vcr_cassette 'booklists'
    it 'should request booklists' do    
      
      @client = UsaTodayBooks::BestSellers.new(:api_key => "foobar")
      @books = @client.booklists(:year => 2011, :month => 5, :date => 12)
      @books["BookLists"].first["BookListEntries"].first["Author"].should == "Charlaine Harris"
    end    
  end
  
  context '#categories' do    
    use_vcr_cassette 'categories'
    it 'should request categories' do    
      
      @client = UsaTodayBooks::BestSellers.new(:api_key => "foobar")
      @books = @client.categories(:title => "Harry Potter")
      @books["Categories"].first["CategoryName"].should == "Youth"
    end    
  end
  
  context '#titles' do    
    use_vcr_cassette 'titles'
    it 'should request titles' do    
      
      @client = UsaTodayBooks::BestSellers.new(:api_key => "foobar")
      @books = @client.titles(:author => "J.K. Rowling")
      @books["Titles"].first["Title"].should == "Fantastic Beasts & Where to Find Them"
    end    
    
    use_vcr_cassette 'titles_with_isbn'
    it 'should request titles by isbn' do    
      
      @client = UsaTodayBooks::BestSellers.new(:api_key => "foobar")
      @books = @client.titles(:isbn => "9780545010221")
      @books["Title"]["BookListAppearances"].should == 78
    end
  end
end