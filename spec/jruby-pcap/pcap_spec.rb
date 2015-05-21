require 'spec_helper'

describe Jruby::Pcap do
  it 'has a version number' do
    expect(Jruby::Pcap::VERSION).not_to be nil
  end

  context "open a new pcap file" do
    let(:file)       { "spec/fixtures/ransomware.pcap" }
    subject(:handle) { Jruby::Pcap.open(file) }

    it "open a new handle" do
      expect(handle).to  be_a Jruby::Pcap::FileHandle
    end

  end

  context "live get of packets" do
    subject(:handle) { Jruby::Pcap }

    xit "open a new handle" do
      handle.live("en0")
      #expect(handle.live("en0")).to be Jruby::Pcap::Handle
    end
  end
end
