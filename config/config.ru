$:.unshift File.expand_path('../../lib', __FILE__)
require 'myrddin_reader'

run MyrddinReader::Publisher
