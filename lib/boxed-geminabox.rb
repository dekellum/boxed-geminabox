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

require 'fileutils'

require 'fishwife'
require 'hooker'

require 'geminabox'

require 'boxed-geminabox/base'

module Boxed::Geminabox

  def self.configure( &block )
    Hooker.with( :bgb, &block )
  end

  class Server < Fishwife::HttpServer

    DEFAULT_PORT = 5791

    def initialize( local_options = {} )
      opts = { :port => DEFAULT_PORT,
               :min_threads => 2,
               :max_threads => 5,
               :request_log_file => :stderr }

      opts = opts.merge( local_options )
      opts = Hooker.merge( [ :bgb, :http_server ], opts )
      super( opts )
    end

    def start( app = geminabox_app )
      super( app )
    end

    def geminabox_app
      ::Geminabox.tap do |box|
        box.data = './data'

        Hooker.apply( [ :bgb, :geminabox ], box )

        # Make our data dir if it doesn't already exist
        FileUtils.mkdir_p( box.data, :mode => 0755 )
      end
    end

  end

end
