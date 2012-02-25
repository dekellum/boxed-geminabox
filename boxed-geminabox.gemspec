# -*- ruby -*-

gem 'rjack-tarpit', '~> 2.0'
require 'rjack-tarpit/spec'

RJack::TarPit.specify do |s|
  require 'boxed-geminabox/base'

  s.version = Boxed::Geminabox::VERSION

  s.add_developer( 'David Kellum', 'dek-oss@gravitext.com' )

  s.depend 'fishwife',              '~> 1.3.0'
  s.depend 'geminabox',             '~> 0.5.2'
  s.depend 'hooker',                '~> 1.0.0'
  s.depend 'rjack-logback',         '~> 1.2'

  s.platform = :java
end