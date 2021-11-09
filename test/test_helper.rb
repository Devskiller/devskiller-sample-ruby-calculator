$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'calculator'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::Reporters::JUnitReporter.new]