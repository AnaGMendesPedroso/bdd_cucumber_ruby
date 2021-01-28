require "shouty_first_iteration"

ParameterType(
name: 'person',
regexp: /(\w+)/,
transformer: ->(name) { ShoutyFirstIteration::Person.new(name, $network) }
)