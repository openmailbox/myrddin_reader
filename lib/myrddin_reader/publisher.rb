require 'sinatra/base'
require 'builder'

module MyrddinReader
  class Publisher < Sinatra::Base
    get '/' do
      'BBoard Index'
    end
  end
end
