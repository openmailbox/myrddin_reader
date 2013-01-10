require 'net/telnet'

module MyrddinReader
  class Bot < Net::Telnet
    def initialize(host, port, user, password, prefix='+', bb_delim='')
      super('Host' => host, 
            'Port' => port, 
            'Timeout' => 1,
            'Waittime' => 1,
            'Prompt' => /.*/,
            'Telnetmode' => false)
      @port, @host = Socket.unpack_sockaddr_in(sock.getpeername)
      @history = []
      @username, @password, @prefix, @bb_delim = user, password, prefix, bb_delim
      login
      keepalive
    end

    def bb_list
      bb_command('list')
      @history.last
    end

    private

    def cmd(options)
      flush
      @last_command = Time.now
      super(options) { |data| read(data) }
    end

    def bb_command(command)
      cmd "#{@prefix}bb#{@split}#{command}"
    end

    def flush
      waitfor('Prompt' => /.*/)
    end

    def keepalive
      if (@last_command + (60 * 60)) > Time.now
        flush
        cmd "think Keepalive"
        Thread.new { sleep(3600); keepalive }
      end
    end

    def login
      cmd "connect #{@username} #{@password}" do |data| 
        read(data) 
      end
    end

    def read(data)
      @history.shift if @history.length > 10
      @history << data
    end
  end
end
