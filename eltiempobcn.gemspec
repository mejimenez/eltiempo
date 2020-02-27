Gem::Specification.new do |s|
  s.name      = 'eltiempobcn'
  s.version   = '0.0.1'
  s.platform  = Gem::Platform::RUBY
  s.summary   = 'ElTiempoBcn test gem'
  s.description = "It's a simple gem to get the ability to get the weather for different regions in Catalonia using CLI"
  s.authors   = ['Marcelo Jimenez']
  s.email     = ['mejimenez@gmail.com']
  s.homepage  = 'http://rubygems.org/gems/eltiempobcn'
  s.license   = 'MIT'
  s.files     = Dir.glob("{lib,bin}/**/*")
  s.require_path = 'lib'
  s.executables = ['eltiempo']
end
