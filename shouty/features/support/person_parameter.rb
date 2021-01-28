require "shouty_first_iteration"

ParameterType(
name: 'person_first_iteration',
regexp: /(\w+)/,
transformer: ->(name) { ShoutyFirstIteration::Person.new(name, $network) }
)