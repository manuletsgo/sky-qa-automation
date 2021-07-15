# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'SKY'
  spec.version       = '0.1'
  spec.authors       = ['Emanuele Amanda Marques']
  spec.email         = ['emanuele4dev@gmail.com']

  spec.summary       = 'BDD - SKY'
  spec.homepage      = ''
  spec.licenses      = ['UNLICENSED']

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec)/})
  end

  spec.bindir = 'bin'

end
