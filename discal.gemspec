Gem::Specification.new do |s|
  s.name                         = "Discal"
  s.version                      = "1.0.0"
  s.date                         = "2019-04-23"
  s.summary                      = "Gets the distance between two points"
  s.description                  = "Gets the distance between two points through two functions (math and 3rd API)"
  s.author                       = "Pablo Marti [new email: pablo.marti.dev@gmail.com]"
  s.email                        = "pablo.marti89@gmail.com"
  s.files                        = ["lib/discal.rb"]
  s.homepage                     = "http://rubygems.org/gems/discal"
  s.license                      = "MIT"

  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'haversine', '~> 0.3.2'
end
