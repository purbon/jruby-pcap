require "jruby-pcap/packet"
java_import java.sql.Timestamp

module Jruby::Pcap
  class FileHandle

    include Enumerable
    attr_reader :handle

    def initialize(handle)
      @handle = handle
    end

    def each
      next_packet = @handle.next_packet_ex
      if next_packet
        yield Jruby::Pcap::Packet.new(next_packet, @handle)
      end
    end

  end
end
