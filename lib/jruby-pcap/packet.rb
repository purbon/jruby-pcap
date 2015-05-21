require "jruby-pcap/frame"

module Jruby::Pcap
  class Packet

    def initialize(packet, handle)
      @packet = packet
      @handle = handle
    end

    def timestamp
      @handle.get_timestamp_ints * 1000
    end

    def ipv4
      Frame.new(@handle, @packet.get(IpV4Packet))
    end

    def to_s
      @packet.to_s
    end
  end
end
