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
      dataset = @packet.get(IpV4Packet)
      Frame.new( @handle, dataset ) if dataset
    end

    def udp
      dataset = @packet.get(UdpPacket)
      Frame.new( @handle, dataset ) if dataset
    end

    def tcp
      dataset = @packet.get(TcpPacket)
      Frame.new( @handle, dataset ) if dataset
    end

    def to_hash
      hash  = {}
      hash.merge!(ipv4.to_hash) if ipv4
      hash.merge!(tcp.to_hash)  if tcp
      hash.merge!(udp.to_hash)  if udp
      hash
    end

    def to_s
      @packet.to_s
    end
  end
end
