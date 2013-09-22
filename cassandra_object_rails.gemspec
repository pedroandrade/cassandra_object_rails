# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'cassandra_object_rails'
  s.version = '0.0.1'
  s.description = 'Cassandra ActiveModel'
  s.summary = 'Cassandra ActiveModel'
  s.authors = ["Lucas Allan Amorim"]
  s.email = 'lucas.allan@gmail.com'
  s.homepage = 'http://github.com/lucasallan/cassandra_object'

  s.required_ruby_version     = '>= 1.9.2'
  s.required_rubygems_version = '>= 1.3.5'

  s.extra_rdoc_files = ["README.rdoc"]
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency('activemodel', '>= 3.0')
  s.add_runtime_dependency('cassandra-cql')
  s.add_runtime_dependency('thrift_client', '~> 0.9.2')
  s.add_runtime_dependency('thin')

  s.add_development_dependency('bundler')
end
