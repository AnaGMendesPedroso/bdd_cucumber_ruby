require 'shouty_first_iteration'

Before do
  $network = ShoutyFirstIteration::Network.new
  @people = {}
end

Given('a person named {person_first_iteration}') do |person|
  @people[person.name] = person
end

Given('{person_first_iteration} is {int} metre(s) from Sean') do |person, distance|
  @people[person.name].move_to(distance)
end

When('{person_first_iteration} shouts {string}') do |person, message|
  @people[person.name].shout(message)
  @message_shouted = message
  @people.each do |person_at_hash|
    person_at_hash.last.hear(message) if person_at_hash.last.name != person.name
  end
end

When('{person_first_iteration} shouts {string} and {string}') do |person, message_one, message_two|
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

Then("{person_first_iteration} should hear {person_first_iteration}'s message") do |listener, shouter|
  expect(@people[listener.name].messages_heard).to include @message_shouted
end

Then("{person_first_iteration} should hear {person_first_iteration}'s messages") do |listener, shouter|
  expect(@people[listener.name].messages_heard).to include @first_message_shouted, @secound_message_shouted
end