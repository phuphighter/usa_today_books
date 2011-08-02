require 'rubygems'
require 'httparty'
require 'hashie'
require 'json'
require 'uri'

directory = File.expand_path(File.dirname(__FILE__))

Hash.send :include, Hashie::HashExtensions

module UsaTodayBooks
  def self.configure
    yield self
    true
  end

  class << self
    attr_accessor :api_key
  end
end

require File.join(directory, 'usa_today_books', 'best_sellers')
