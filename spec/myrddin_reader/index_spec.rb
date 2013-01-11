require 'spec_helper'

module MyrddinReader
  describe Index do
    before(:all) do
      @text = File.open('spec/support/bblist.txt') { |f| f.readlines }.join
    end

    let(:index) { Index.new(@text) }
    subject { index }

    it { should have(3).boards }
  end
end
