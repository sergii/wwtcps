require 'minitest/autorun'
require 'minitest/pride'
require 'socket'

class Chapter1SocketTest < MiniTest::Unit::TestCase
  def test_socket_inspect
    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

    assert_match /#<Socket:fd \d>/, socket.inspect
  end
end
