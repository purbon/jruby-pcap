require "java"
require "jruby-pcap/version"
require "jruby-pcap/file_handle"
require "jruby-pcap/live_handle"

require "jars/pcap4j-core-1.4.0.jar"
require "jars/pcap4j-packetfactory-static-1.4.0.jar"
require "jars/jna-4.1.0.jar"
require "jars/slf4j-api-1.6.4.jar"

java_import org.pcap4j.core.PcapHandle
java_import org.pcap4j.core.PcapNativeException
java_import org.pcap4j.core.Pcaps
java_import org.pcap4j.packet.IpV4Packet
java_import org.pcap4j.packet.Packet
java_import org.pcap4j.packet.TcpPacket
java_import org.pcap4j.packet.UdpPacket
java_import org.pcap4j.util.NifSelector
java_import org.pcap4j.core.PcapNetworkInterface

module Jruby
  module Pcap

    def self.open(file)
      FileHandle.new(Pcaps.openOffline(file))
    end

    def self.live(name)
      interface  = Pcaps.get_dev_by_name(name)
      LiveHandle.new(interface)
    end

    def self.devs
      Pcaps.findAllDevs
    end
  end
end
