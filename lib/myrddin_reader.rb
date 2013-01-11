ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['RACK_ENV'] ||= 'production'


require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require 'yaml'
module MyrddinReader
  config = YAML.load_file(File.expand_path('../../config/login.yml', __FILE__))
  CONFIG = config[ENV['RACK_ENV']]
end

require 'myrddin_reader/bboard'
require 'myrddin_reader/bot'
require 'myrddin_reader/index'
require 'myrddin_reader/publisher'
