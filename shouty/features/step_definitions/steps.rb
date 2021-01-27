require "shouty"

Given('{person} is located {int}m from Sean') do |person, distance|
  @sean = Shouty::Person.new('Sean')
  @person = person
  @person.move_to(distance)
end

When('Sean shouts {string}') do |message|
  @sean.shout(message)
  @message_from_sean = message
  @person.messages_heard_from(message)
end

When('Sean shouts {string} and {string}') do |message_one, message_two|
  @sean.shout(message_one)
  @first_message_from_sean = message_one
  @person.messages_heard_from(message_one)

  @sean.shout(message_two)
  @secound_message_from_sean = message_two
  @person.messages_heard_from(message_two)
end

Then("{person} hears Sean's message") do |person|
  expect(@person.messages_heard).to include @message_from_sean
end

Then("{person} hears Sean's messages") do |person|
  expect(@person.messages_heard).to include @first_message_from_sean, @secound_message_from_sean
end