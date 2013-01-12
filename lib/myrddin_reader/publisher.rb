require 'sinatra/base'

module MyrddinReader
  class Publisher < Sinatra::Base
    use Rack::Auth::Basic do |username, password|
      username == CONFIG['web_username'] and password == CONFIG['web_password']
    end

    before do
      @@bot ||= new_bot
    end

    get '/' do
      @index = Index.new(@@bot.bb_list)
      haml :index
    end

    private

    def new_bot
      @@bot = Bot.new(CONFIG['mush_host'],
                      CONFIG['mush_port'],
                      CONFIG['mush_name'],
                      CONFIG['mush_password']
                     )
    end
  end
end
