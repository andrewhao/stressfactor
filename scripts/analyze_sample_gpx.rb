require_relative "../lib/stressfactor"
require "pry"
file = GPX::GPXFile.new(:gpx_file => "examples/data/sample.gpx")
pc = Stressfactor::PaceCalculator.new(file)
pace = pc.calculate
puts pace
binding.pry
