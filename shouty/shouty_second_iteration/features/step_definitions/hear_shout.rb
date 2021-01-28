require 'shouty'

DEFAULT_RANGE = 100

Before do
    @network = Shouty::Network.new(DEFAULT_RANGE)
    @people = {}
end

Given 'the range is {int}' do |range|
    @network = Shouty::Network.new(range)
end

Given 'a beautifull person named {word}' do |name|
    @people[name] = Shouty::Person.new(@network, 0)
end

Given('people are located at') do |table|
table.transpose.symbolic_hashes.each do |name:, location:|
        @people[name] = Shouty::Person.new(@network, location.to_i)
    end
end

When 'Sean shouts louder {string}' do |message|
    @people['Sean'].shout(message)
    @message_from_sean = message
  end

When 'Sean shouts' do
    @people['Sean'].shout('Hello world!')
end

Then 'Lucy should hear a shout' do
    expect(@people['Lucy'].messages_heard.count).to eq(1)
end

Then "Lucy should hear loud and clear Sean's message" do
    expect(@people['Lucy'].messages_heard).to eq [@message_from_sean]
  end

Then "Larry should not hear Sean's message" do
    expect(@people['Larry'].messages_heard).not_to include(@message_from_sean)
end

Then 'Larry should not hear a shout' do
    expect(@people['Larry'].messages_heard.count).to eq(0)
end

Then 'Lucy hears the following messages:' do |expected_messages|
    actual_messages = @people['Lucy'].messages_heard.map { |message| [message] }
    expected_messages.diff!(actual_messages)
end