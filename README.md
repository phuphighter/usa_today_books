# USA Today Books API

Ruby wrapper for the [USA Today Books API](http://developer.usatoday.com/docs/read/bestselling_books).

## Installation

Inside your Gemfile:
  gem 'usa_today_books'
    
## Get an API key

Go here: [http://developer.usatoday.com/apps](http://developer.usatoday.com/apps)
    
## Usage

### Instantiate a client

    >> @client = UsaTodayBooks::BestSellers.new(:api_key => 'your_api_key')
    
## Examples

#### Get booklists by date

    >> @books = @client.booklists(:year => 2011, :month => 5, :date => 12)
    >> @books["BookLists"].first["BookListEntries"].first["Author"]
    => "Charlaine Harris"
    
#### Get titles by ISBN

    >> @books = @client.titles(:isbn => "9780545010221")
    >> @books["Title"]["BookListAppearances"]
    => 78

## Copyright

Contact me if you have any suggestions and feel free to fork it!

Copyright (c) 2011 Johnny Khai Nguyen, released under the MIT license
