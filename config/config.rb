Boxed::Geminabox.configure do |cs|

  cs.setup_http_server do
    { # :port => 5791
    }
  end

  cs.setup_geminabox do |box|
    # box.data = "./data"
  end

end
