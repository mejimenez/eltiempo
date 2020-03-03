Gem::Specification.new do |s|
  s.name      = 'eltiempobcn'
  s.version   = '0.3.0'
  s.platform  = Gem::Platform::RUBY
  s.summary   = 'eltiempo -today "Barcelona" will tell you the min and max for today'
  s.description = "It's a simple gem to get the weather for different regions in Catalonia using CLI. Is handling Windows console encodings."
  s.authors   = ['Marcelo Jimenez']
  s.email     = ['mejimenez@gmail.com']
  s.homepage  = 'https://github.com/mejimenez/eltiempo'
  s.license   = 'MIT'
  s.files     = Dir.glob("{lib,bin}/**/*")
  s.require_path = 'lib'
  s.executables = ['eltiempo']
  s.add_runtime_dependency 'thor', '~> 0'
  s.add_runtime_dependency 'nokogiri'
  s.add_runtime_dependency 'i18n'
end
