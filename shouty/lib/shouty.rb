module Shouty
    class Person
        attr_accessor :name, :messages_heard, :distance, :message_shout

        def initialize(name, messages_heard = [], distance = 0, message_shout = [])
            @name = name
            @messages_heard = messages_heard
            @message_shout = message_shout
            @distance = distance
        end

        def move_to(distance)
            @distance = distance
        end

        def shout(message)
            @message_shout = message
        end

        def messages_heard_from(message)
            @messages_heard.push(message)
        end
    end
end