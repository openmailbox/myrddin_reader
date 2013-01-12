ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['RACK_ENV'] ||= 'production'

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

require 'yaml'
module MyrddinReader
  settings_file = File.expand_path('../../config/settings.yml', __FILE__)
  CONFIG = YAML.load_file(settings_file)[ENV['RACK_ENV']]
end

require 'myrddin_reader/bboard'
require 'myrddin_reader/bot'
require 'myrddin_reader/index'
require 'myrddin_reader/publisher'
