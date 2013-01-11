require 'spec_helper'

module MyrddinReader
  describe Index do
    before(:all) do
      @text = File.open('spec/support/bblist.txt') { |f| f.readlines }.join
    end

    let(:index) { Index.new(@text) }

    it 'inits and builds an index' do
      index.should have(3).boards
    end
  end
end
