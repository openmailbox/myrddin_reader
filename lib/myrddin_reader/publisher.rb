require 'sinatra'

module MyrddinReader
  class Publisher < Sinatra::Base
    get '/' do
      @bot ||= Bot.new('127.0.0.1', 4201, 'Bot', 'bot')
      BBoard.build_index(@bot.bb_list)

      builder do |xml|
        xml.instruct! :xml, :version => '1.0'
        xml.rss :version => '2.0' do
          xml.channel do
            xml.title 'BBoard Index'

            BBoard.boards.each do |bboard|
              xml.item do
                xml.title bboard.title
                xml.description "Board #{bboard.number} - #{bboard.title}"
              end
            end
          end
        end
      end
    end
  end
end
