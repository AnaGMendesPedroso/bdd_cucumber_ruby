require 'shouty'

Before do
  $network = Shouty::Network.new
  @people = {}
end

Given('a person named {person}') do |person|
  @people[person.name] = person
end

Given('{person} is {int} metre(s) from Sean') do |person, distance|
  @people[person.name].move_to(distance)
end

When('{person} shouts {string}') do |person, message|
  @people[person.name].shout(message)
  @message_shouted = message
  @people.each do |person_at_hash|
    person_at_hash.last.hear(message) if person_at_hash.last.name != person.name
  end
end

When('{person} shouts {string} and {string}') do |person, message_one, message_two|
  @people[person.name].shout(message_one)
  @first_message_shouted = message_one
  @people.each do |person_at_hash|
    person_at_hash.last.hear(message_one) if person_at_hash.last.name != person.name
  end

  @people[person.name].shout(message_two)
  @secound_message_shouted = message_two
  @people.each do |person_at_hash|
    person_at_hash.last.hear(message_two) if person_at_hash.last.name != person.name
  end
end

Then("{person} should hear {person}'s message") do |listener, shouter|
  expect(@people[listener.name].messages_heard).to include @message_shouted
end

Then("{person} should hear {person}'s messages") do |listener, shouter|
  expect(@people[listener.name].messages_heard).to include @first_message_shouted, @secound_message_shouted
end