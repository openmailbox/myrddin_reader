require 'spec_helper'

module MyrddinReader
  describe BBoard do
    subject { BBoard.new(1, 'Test Board') }

    its(:title) { should == 'Test Board' }
    its(:number) { should == 1 }
  end
end
