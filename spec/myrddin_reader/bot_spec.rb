require 'spec_helper'

module MyrddinReader
  describe Bot do
    let(:host) { TEST_HOST }
    let(:port) { TEST_PORT }
    let(:user) { TEST_USERNAME }
    let(:password) { TEST_PASSWORD }
    let(:bot) { Bot.new(host, port, user, password) }
    subject { bot }

    it { should be_kind_of(Net::Telnet) }
    it 'provides a list of bboards' do
      bot.bb_list.should be_kind_of(String)
    end
  end
end
