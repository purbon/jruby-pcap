module Jruby::Pcap
  class Frame

    def initialize(handle, frame)
      @handle = handle
      @frame  = frame
      @header = @frame.header
    end

    def src_addr
      @header.src_addr.to_s.gsub("/","")
    end

    def src_host
      @header.src_addr.host_name
    end

    def src_port
      @header.src_port.value_as_string
    end

    def src_port_name
      @header.src_port.name
    end

    def dst_addr
      @header.dst_addr.to_s.gsub("/","")
    end

    def dst_host
      @header.dst_addr.host_name
    end

    def dst_port
      @header.dst_port.value_as_string
    end

    def dst_port_name
      @header.dst_port.name
    end

    def protocol
      @header.protocol.name
    end

    def version
      @header.version.name
    end

    def length
      @frame.length
    end

    def to_hash
      hash = {}
      if (@frame.is_a?(IpV4Packet))
        hash['src_addr']  = src_addr
        hash['dst_addr']  = dst_addr
        hash['procotol']  = protocol
        hash['version']   = version
        hash['ip_length'] = length
      elsif (@frame.is_a?(TcpPacket) || @frame.is_a?(UdpPacket))
        hash['src_port'] = src_port
        hash['src_port_name'] = src_port_name
        hash['dst_port'] = dst_port
        hash['dst_port_name'] = dst_port_name
        hash['tcpip_length'] = length
      end
      hash
    end

  end
end
