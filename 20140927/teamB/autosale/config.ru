require 'draw_uml'
use Rack::Static, urls: ['/images'], root: 'public'
run DrawUml::Engine
