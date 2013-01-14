require 'sinatra/base'

module MyrddinReader
  class Publisher < Sinatra::Base
    def self.new_bot
      Bot.new(CONFIG['mush_host'],
              CONFIG['mush_port'],
              CONFIG['mush_name'],
              CONFIG['mush_password']
             )
    end

    def self.build_routes
      Index.new(@@bot.bb_list).boards.each do |board|
        get "/#{board.title.downcase.gsub(' ','_')}" do
          index = Index.new(@@bot.bb_list)
          @board = index.boards.find { |i| i.title == board.title }
          haml :board_index
        end
      end
    end

    private_class_method :new_bot, :build_routes

    @@bot = new_bot

    build_routes

    use Rack::Auth::Basic do |username, password|
      username == CONFIG['web_username'] and password == CONFIG['web_password']
    end

    before do
      @@bot ||= self.new_bot
    end

    get '/' do
      @index = Index.new(@@bot.bb_list)
      haml :index
    end

    
  end 
end
