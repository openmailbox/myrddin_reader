ENV['RACK_ENV'] = 'test'
$:.unshift File.expand_path('../../lib', __FILE__)

require 'myrddin_reader'

TEST_HOST = MyrddinReader::CONFIG['mush_host']
TEST_PORT = MyrddinReader::CONFIG['mush_port']
TEST_USERNAME = MyrddinReader::CONFIG['mush_name']
TEST_PASSWORD = MyrddinReader::CONFIG['mush_password']

RSpec.configure do |config|
end
