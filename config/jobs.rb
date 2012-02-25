# See Iyyov: https://github.com/dekellum/iyyov#readme

Iyyov.context do |c|

  c.define_daemon do |d|
    d.name     = "boxed-geminabox"
    d.version  = "~> 1.0"
    d.log_rotate
  end

end
