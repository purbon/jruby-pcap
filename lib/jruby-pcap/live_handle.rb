require "jruby-pcap/packet"
java_import java.sql.Timestamp

module Jruby::Pcap
  class LiveHandle

    include Enumerable

    def initialize(interface)
      @interface = interface
    end

    def each
      handle = @interface.open_live(1024, PcapNetworkInterface::PromiscuousMode::PROMISCUOUS, 0)
      while true do
        puts "start"
        next_packet = handle.next_packet_ex
        puts "next_packet"
        if next_packet
          yield Packet.new(next_packet, handle)
        else
          break
        end
      end
    end

  end
end
