require 'spec_helper'

describe Jruby::Pcap do

  let(:file)   { "spec/fixtures/ransomware.pcap" }
  let(:handle) { Jruby::Pcap.open(file) }

  subject(:packet) { handle.first }

  context "handling a packet" do

    it "able to get a packet timestamp" do
      expect(packet.timestamp).to eq(1431626602000)
    end

  end

  context "when fetching the ipv4 frame" do

    subject(:frame) { packet.ipv4 }

    it "get the src_addr attribute" do
      expect(frame.src_addr).to eq("192.168.122.84")
    end

    it "get the src_host attribute" do
      expect(frame.src_host).to eq("192.168.122.84")
    end
  end

  describe "handling live packets" do

    let(:handle) { Jruby::Pcap.live("en0") }
    let(:now)    { Time.now.to_i }

    xit "able to get a packet timestamp" do
      expect(packet.timestamp).to be > now
    end

  end
end
