require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'vcr_setup'
require 'usa_today_books'

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end