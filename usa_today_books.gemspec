# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "usa_today_books/version"

Gem::Specification.new do |s|
  s.name        = "usa_today_books"
  s.version     = UsaTodayBooks::VERSION
  s.authors     = ["Johnny Khai Nguyen"]
  s.email       = ["johnny.nguyen@rethinkbooks.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby wrapper for the USA Today books API}
  s.description = %q{Use this gem to access data from the USA Today books API in your Ruby application}

  s.rubyforge_project = "usa_today_books"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
    
  s.add_dependency 'httparty'
  s.add_dependency 'hashie'  
  s.add_dependency 'json'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'vcr'
end