require "spec_helper"
require "./lib/shouty"

RSpec.describe Shouty::Network do

  before(:each) do
    @networkStub = spy(Shouty::Network)
  end

  it "subscribes to the network" do
    lucy = Shouty::Person.new('Lucy', @networkStub)

    expect(@networkStub).to have_received(:subscribe).with(lucy)
  end

  it "broadcasts shouts to the network" do
    message = "Free bagels!"
    sean = Shouty::Person.new('Sean', @networkStub)

    sean.shout(message)

    expect(@networkStub).to have_received(:broadcast).with(message)
  end

  it "remembers messages heard" do
    message = "Free bagels!"
    lucy = Shouty::Person.new('Lucy', @networkStub)

    lucy.hear(message)

    expect(lucy.messages_heard).to eq([message])
  end

end