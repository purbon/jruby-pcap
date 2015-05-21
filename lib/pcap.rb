require "java"
require "jruby-pcap/version"
require "jruby-pcap/handle"

require "jars/pcap4j-core-1.4.0.jar"
require "jars/pcap4j-packetfactory-static-1.4.0.jar"
require "jars/jna-4.1.0.jar"
require "jars/slf4j-api-1.6.4.jar"

java_import org.pcap4j.core.PcapHandle
java_import org.pcap4j.core.PcapNativeException
java_import org.pcap4j.core.Pcaps
java_import org.pcap4j.packet.IpV4Packet;
java_import org.pcap4j.packet.Packet;
java_import org.pcap4j.packet.TcpPacket;
java_import org.pcap4j.packet.UdpPacket;

module Jruby
  module Pcap
    def self.open(file)
      Handle.new(Pcaps.openOffline(file))
    end
  end
end
