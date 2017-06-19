Gem::Specification.new do |s|
  s.name        = 'fintools'
  s.version     = '0.0.3'
  s.date        = '2017-06-15'
  s.summary     = "Financial Tools in Ruby"
  s.description = "A Collection of financial tools in Ruby. Things like SMA, EMA, MACD etc"
  s.authors     = ["Peter Andersson"]
  s.email       = 'fshsweden@gmail.com'
  s.files       = ["lib/fintools.rb"]
  s.homepage    = 'http://rubygems.org/gems/fintools'
  s.license     = 'MIT'

  s.add_runtime_dependency "indicators",["~> 0"]
  s.add_development_dependency "indicators",["~> 0"]
end

