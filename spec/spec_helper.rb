ENV['MYRDDIN_READER_ENV'] = 'test'
$:.unshift File.expand_path('../../lib', __FILE__)

require 'myrddin_reader'

TEST_HOST = MyrddinReader::CONFIG['host']
TEST_PORT = MyrddinReader::CONFIG['port']
TEST_USERNAME = MyrddinReader::CONFIG['name']
TEST_PASSWORD = MyrddinReader::CONFIG['password']

RSpec.configure do |config|
end
