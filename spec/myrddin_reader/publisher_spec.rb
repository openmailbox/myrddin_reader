require 'spec_helper'

module MyrddinReader
  describe Publisher do
    before(:all) do
      Publisher.class_exec { @routes = {'GET' => [], 'HEAD' => []} }
    end

    let(:bot) { double('Bot') }
    let(:bb_list) { File.open('spec/support/bblist.txt') { |i| i.readlines }.join }

    before(:each) do
      Publisher.class_variable_set(:@@bot, bot)
    end

    it 'has a class accessible bot' do
      Publisher.class_variable_get(:@@bot).should_not be_nil
    end

    it 'builds a list of routes' do
      bot.stub(:bb_list).and_return(bb_list)
      lambda {
        Publisher.class_eval('build_routes')
      }.should change { Publisher.routes['GET'].count }.by(3)
    end
    
  end
end
