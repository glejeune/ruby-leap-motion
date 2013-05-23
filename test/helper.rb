require 'rubygems'
require 'bundler/setup'
require 'test/unit'
require 'shoulda'
require 'pathname'

cur = Pathname.new(File.expand_path("..", __FILE__))
lib = cur.join('..', 'lib')
ext = cur.join('..', 'ext')

unless ext.join("motion.so").exist? or ext.join("motion.bundle").exist? or ext.join("motion.dll").exist?
  abort " ! Unable to run tests. Please run `rake compile` first"
end

$LOAD_PATH.unshift(lib.to_s, ext.to_s, cur.to_s)
require 'motion'

