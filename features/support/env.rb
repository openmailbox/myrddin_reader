ENV['RACK_ENV'] = 'test'
$:.unshift File.expand_path('../../../lib', __FILE__)

require 'myrddin_reader'
require 'capybara/cucumber'

Capybara.app = MyrddinReader::Publisher

