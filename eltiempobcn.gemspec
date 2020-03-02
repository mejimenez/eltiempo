Gem::Specification.new do |s|
  s.name      = 'eltiempobcn'
  s.version   = '0.2.0'
  s.platform  = Gem::Platform::RUBY
  s.summary   = 'ElTiempoBcn test gem'
  s.description = "It's a simple gem to get the ability to get the weather for different regions in Catalonia using CLI"
  s.authors   = ['Marcelo Jimenez']
  s.email     = ['mejimenez@gmail.com']
  s.homepage  = 'https://github.com/mejimenez/eltiempo'
  s.license   = 'MIT'
  s.files     = Dir.glob("{lib,bin}/**/*")
  s.require_path = 'lib'
  s.executables = ['eltiempo']
  s.add_runtime_dependency 'thor', '~> 0'
  s.add_runtime_dependency 'nokogiri'
  s.add_development_dependency 'byebug', '~> 0'
end
