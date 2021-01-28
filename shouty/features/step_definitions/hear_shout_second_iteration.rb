require 'shouty_second_iteration'

Before do
    @people = {}
end

Given "the range is {int}" do |range|
    @network = ShoutySecondIteration::Network.new(range)
end

Given "a person named {word} is located at {int}" do |name, location|
    @people[name] = ShoutySecondIteration::Person.new(@network, location)
end

Then "Larry should not hear Sean's message" do
    expect(@people['Larry'].messages_heard).not_to include(@message_from_sean)
end