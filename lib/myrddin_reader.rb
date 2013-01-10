ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['MYRDDIN_READER_ENV'] ||= 'production'


require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['MYRDDIN_READER_ENV'])

require 'yaml'
module MyrddinReader
  config = YAML.load_file(File.expand_path('../../config/login.yml', __FILE__))
  CONFIG = config[ENV['MYRDDIN_READER_ENV']]
end

require 'myrddin_reader/bboard'
require 'myrddin_reader/bot'
require 'myrddin_reader/publisher'
