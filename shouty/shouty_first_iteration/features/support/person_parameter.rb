require "shouty"

ParameterType(
name: 'person',
regexp: /(\w+)/,
transformer: ->(name) { Shouty::Person.new(name, $network) }
)