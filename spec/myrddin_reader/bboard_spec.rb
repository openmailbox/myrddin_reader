require 'spec_helper'

module MyrddinReader
  describe BBoard do
    before(:all) do
      @text = File.open('spec/support/bblist.txt') { |f| f.readlines }.join
    end

    context 'index' do
      it 'has an index of bboards' do
        2.times { BBoard.new(1, 'test') }
        BBoard.should have(2).boards
      end

      it 'builds the index from a string' do
        BBoard.build_index(@text)
        BBoard.boards.should have(3).boards
      end
    end

    context 'single board' do
      subject { BBoard.boards.first }

      its(:title) { should == 'Game Announcements' }
      its(:number) { should == 1 }
    end
  end
end
