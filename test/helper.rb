require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'coletivo'
require 'mongoid'
require 'test/unit'
require 'turn'
require 'shoulda'

Mongoid.load!(File.join(File.dirname(__FILE__), '..', 'config', "mongoid.yml"))

Mongoid.database.collections.each do |coll|
  coll.remove if coll.name !~ /system/
end

class Test::Unit::TestCase
end
