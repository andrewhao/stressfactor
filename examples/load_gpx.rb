require 'gpx'
require 'pry'

gpx = GPX::GPXFile.new(:gpx_file => "examples/data/sample.gpx")
binding.pry
