# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: pinger.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("pinger.proto", :syntax => :proto3) do
    add_message "pinger.Empty" do
    end
    add_message "pinger.PingRequest" do
      optional :count, :int32, 1
    end
    add_message "pinger.Pong" do
      optional :text, :string, 1
    end
  end
end

module Pinger
  Empty = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("pinger.Empty").msgclass
  PingRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("pinger.PingRequest").msgclass
  Pong = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("pinger.Pong").msgclass
end