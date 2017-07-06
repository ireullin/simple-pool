# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "simple-pool"
  spec.version       = '0.0.2'
  spec.authors       = ["ireullin"]
  spec.email         = ["ireullin@gmail.com"]
  spec.date          = '2017-07-06'
  spec.homepage      = 'https://github.com/ireullin/simple-pool'
  spec.summary       = %Q{A simple thread pool.}
  spec.description   = %Q{A simple thread pool.}
  spec.license       = "MIT"
  spec.files         = ['lib/simple-pool.rb']
end
