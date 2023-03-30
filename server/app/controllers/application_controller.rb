require 'ping_services_pb.rb'
require 'ping_pb.rb'

class ApplicationController < ActionController::API
  def ping
    pong = ping_service.ping(Ping::Empty.new)
    render json: {pong: pong.text}
  end

  def ping_stream
    pong = ping_service.ping_stream(Ping::PingRequest.new(count: 3))
    render json: {pong: pong.map{ |p| p.text }.inspect}
  end

  private

  def ping_service
    @client ||= Ping::PingService::Stub.new('localhost:5300', :this_channel_is_insecure)
  end
end

