require 'spec_helper'
require './lib/shouty_first_iteration'

RSpec.describe ShoutyFirstIteration::Network do
  let(:network) { ShoutyFirstIteration::Network.new }
  let(:message) { 'Free bagels!' }

  it 'broadcasts a message to all listeners' do
    lucy = spy(ShoutyFirstIteration::Person.new('Lucy', network))
    network.subscribe(lucy)
    network.broadcast(message)

    expect(lucy.messages_heard).to have_received(:hear).with(message)
  end
end
