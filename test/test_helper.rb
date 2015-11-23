root = File.expand_path("../../", __FILE__)
lib = File.join(root, 'lib')
test = File.join(root, 'test')

$:.unshift(lib) unless $:.include?(lib)
$:.unshift(test) unless $:.include?(test)

require "minitest/autorun"
