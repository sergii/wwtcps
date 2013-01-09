require 'minitest/autorun'
require 'minitest/pride'
require 'socket'

class Chapter3SocketTest < MiniTest::Unit::TestCase
  def test_socket_bind
    socket = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
    socket.bind(addr)

    assert_raises Errno::EADDRINUSE do
      Socket.new(:INET, :STREAM).bind(addr)
    end
  end

  def test_socket_listen
  	socket = Socket.new(:INET, :STREAM)
  	addr = Socket.pack_sockaddr_in(4482, '0.0.0.0')
  	socket.bind(addr)
  	socket.listen(5)
    # Nothing came up
  end

  def test_socket_accept
    socket = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(4483, '0.0.0.0')
    socket.bind(addr)
    socket.listen(5)

    Thread.new do
      system("echo ohai | nc localhost 4483")
    end

    connection, _ = socket.accept
    c_class = connection.class
    connection.shutdown

    assert_equal Socket, c_class
  end
end