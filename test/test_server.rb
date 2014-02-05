#!/usr/bin/env jruby
#.hashdot.profile += jruby-shortlived

#--
# Copyright (c) 2012-2014 David Kellum
#
# Licensed under the Apache License, Version 2.0 (the "License"); you
# may not use this file except in compliance with the License.  You may
# obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.  See the License for the specific language governing
# permissions and limitations under the License.
#++

require 'rubygems'
require 'bundler/setup'

require 'minitest/unit'
require 'minitest/autorun'

require 'rjack-logback'
RJack::Logback.config_console( :stderr => true )

require 'boxed-geminabox'

require 'net/http'

if ARGV.include?( '-v' ) || ARGV.include?( '--verbose' )
  RJack::Logback.root.level = RJack::Logback::DEBUG
else
  # Make test output logging compatible: no partial lines.
  class TestOut
    def print( *a ); $stdout.puts( *a ); end
    def puts( *a );  $stdout.puts( *a ); end
  end
  MiniTest::Unit.output = TestOut.new
end

class TestServer < MiniTest::Unit::TestCase
  include Boxed::Geminabox

  def test_root
    server = Server.new( :port => 0 )
    server.start

    res = Net::HTTP.start( 'localhost', server.port ) do |http|
      http.get( '/' )
    end
    assert_instance_of( Net::HTTPOK, res )
  ensure
    if server
      server.stop
      server.join
    end
  end

end
