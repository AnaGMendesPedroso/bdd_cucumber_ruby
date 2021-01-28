require 'spec_helper'
require './lib/shouty_second_iteration'

RSpec.describe ShoutySecondIteration::Network do
  let(:range)   { 100 }
  let(:network) { ShoutySecondIteration::Network.new(range) }
  let(:message) { 'Free bagels!' }

  it 'broadcasts a message to a listener within range' do
    sean_location = 0
    lucy = spy(ShoutySecondIteration::Person)
    network.subscribe(lucy)
    network.broadcast(message, sean_location)

    expect(lucy.messages_heard).to have_received(:hear).with(message)
  end

  it 'does not broadcast a message to a listener out of range' do
    sean_location = 0
    laura = spy(ShoutySecondIteration::Person, location: 101)
    network.subscribe(laura)
    network.broadcast(message, sean_location)

    expect(laura.messages_heard).not_to have_received(:hear)
  end

  it 'does not broadcast a message to a listener out of range negative distance' do
    sally_location = 0
    lionel = spy(ShoutySecondIteration::Person, location: -101)
    network.subscribe(lionel)
    network.broadcast(message, sally_location)

    expect(lionel.messages_heard).not_to have_received(:hear)
  end

end
