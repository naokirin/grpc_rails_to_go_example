require 'pinger_services_pb.rb'
require 'pinger_pb.rb'

class ApplicationController < ActionController::API
  def ping
    pinger_stub = Pinger::Pinger::Stub.new('localhost:5300', :this_channel_is_insecure)
    pong = pinger_stub.ping(Pinger::Empty.new)
    render json: {pong: pong.text}
  end

  def ping_stream
    pinger_stub = Pinger::Pinger::Stub.new('localhost:5300', :this_channel_is_insecure)
    pong = pinger_stub.ping_stream(Pinger::PingRequest.new(count: 3))
    render json: {pong: pong.map{ |p| p.text }.inspect}
  end
end

