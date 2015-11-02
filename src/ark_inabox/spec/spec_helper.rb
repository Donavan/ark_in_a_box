require 'simplecov'

SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ark_inabox'
require 'ark_inabox/cli'
