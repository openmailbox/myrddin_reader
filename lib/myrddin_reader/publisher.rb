require 'sinatra/base'

module MyrddinReader
  class Publisher < Sinatra::Base
    use Rack::Auth::Basic do |username, password|
      username == CONFIG['web_username'] and password == CONFIG['web_password']
    end

    get '/' do
      'BBoard Index'
    end
  end
end
