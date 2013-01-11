module MyrddinReader
  class Index
    attr_reader :boards

    def initialize(mushtext)
      @boards = []
      mushtext.split("\n").each do |line|
        next unless line.strip =~ /^[0-9]* .+$/
        parse_bboard(line)
      end
    end

    private 

    def parse_bboard(line)
      line = line.strip.split
      num = line[0].to_i
      title = line[1,line.length - 3].join(' ')
      @boards << BBoard.new(num, title)
    end
  end
end
