require 'minitest/autorun'
require 'minitest/pride'
require 'socket'

class YourFirstSocketTest < MiniTest::Unit::TestCase
  def test_socket_inspect
    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

    assert_match /#<Socket:fd \d>/, socket.inspect
  end

  def test_socket_bind
    socket = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
    socket.bind(addr)

    assert_raises Errno::EADDRINUSE do
      Socket.new(:INET, :STREAM).bind(addr)
    end
  end
end
