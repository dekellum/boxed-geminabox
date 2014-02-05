# -*- ruby -*-

gem 'rjack-tarpit', '~> 2.0'
require 'rjack-tarpit/spec'

RJack::TarPit.specify do |s|
  require 'boxed-geminabox/base'

  s.version = Boxed::Geminabox::VERSION

  s.add_developer( 'David Kellum', 'dek-oss@gravitext.com' )

  s.depend 'fishwife',              '~> 1.5.2'
  s.depend 'rjack-jetty',           '~> 9.1.1'

  s.depend 'geminabox',             '~> 0.12.2'
  s.depend 'hooker',                '~> 1.1.0'
  s.depend 'rjack-logback',         '~> 1.6'

  s.depend 'minitest',              '~> 4.7.4', :dev

  s.platform = :java
end
