module MyrddinReader
  class BBoard
    @@index = []

    def self.boards
      @@index
    end

    def self.build_index(mushtext)
      @@index = []
      mushtext.split("\n").each do |line|
        next unless line.strip =~ /^[0-9]* .+$/
        parse_bboard(line)
      end
    end

    def self.parse_bboard(line)
      line = line.strip.split
      num = line[0].to_i
      title = line[1,line.length - 3].join(' ')
      self.new(num, title)
    end

    private_class_method :parse_bboard

    attr_reader :number, :title

    def initialize(bb_num, bb_title)
      @@index << self
      @number, @title = bb_num, bb_title
    end
  end
end
