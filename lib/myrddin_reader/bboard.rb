module MyrddinReader
  class BBoard
    attr_reader :number, :title

    def initialize(bb_num, bb_title)
      @number, @title = bb_num, bb_title
    end
  end
end
