require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

use Rack::ConditionalGet
use Rack::ETag
use Rack::Rewrite do
  # My orders are to weed out all the hackers who do not pack the gear
  # to get served a request!
  r301 %r{php(My)[Aa]dmin}, 'http://www.phpmyadmin.net/'
  r301 '/wp-login.php', 'http://www.wordpress.com/'

  # Old wiki stuff
  r301 %r{^/wiki/.*}, 'http://wiki.astralfrontier.org$&'
  r301 '/People/The_Republic', 'http://wiki.astralfrontier.org/wiki/Category:Synthetic_Saints'
  r301 '/People/Malfeas', 'http://wiki.astralfrontier.org/wiki/Category:Demons'
  r301 %r{^/People/}, 'http://wiki.astralfrontier.org/wiki/Category:People'
  r301 %r{^/Places/}, 'http://wiki.astralfrontier.org/wiki/Category:Places'

  # Canonical domain name
  r301 %r{.*}, 'http://astralfrontier.org$&', :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] != 'astralfrontier.org' }

  # Old Wordpress content
  r301 '/2012/03/25/brachiation/', '/song-of-eden/brachiation'
  r301 %r{.*}, '/song-of-eden', :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] == 'songs.astralfrontier.org' }

  # AstralFrontier migration
  r301 %r{/rules/shadowrun.*}, '/characters/sureshot'
  r301 %r{/rules/pathfinder(.*)}, '/rpg/pathfinder$1'
  r301 '/stories/wanderer', '/characters/lou/wanderer'
  r301 '/storytelling/22rules', '/writing/22rules'
  r301 '/storytelling', '/writing'
  r301 '/world-building', '/writing'

  # Old content
  r301 %r{^/fanfic(.*)}, '/stories/fanfic$1'
  r301 '/other/christmas-with-claudia', '/stories/christmas-with-claudia'
  r301 '/other/til-death-do-us-part', '/stories/til-death-do-us-part'
end

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'
require './lib/astralfrontier/app'
run AstralFrontier::App
