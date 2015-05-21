module Jruby::Pcap
  class Frame

    def initialize(handle, frame)
      @handle = handle
      @frame  = frame
    end

    def src_addr
      @frame.header.src_addr.to_s.gsub("/","")
    end

    def src_host
      @frame.header.src_addr.host_name
    end

    def is_a?(clazz)

    end
  end
end
