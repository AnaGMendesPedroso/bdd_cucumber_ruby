module Shouty
    class Person
        attr_reader :name, :messages_heard, :network
        
        def initialize(name, network)
          @name = name
          @messages_heard = []
          @network = network
          
          @network.subscribe(self)
        end
    
        def shout(message)
          @network.broadcast(message)
        end
    
        def hear(message)
          @messages_heard << message
        end
    end

    class Network
        def initialize
          @listeners = []
        end
    
        def subscribe(person)
          @listeners << person
        end
    
        def broadcast(message)
          @listeners.each do |listener|
            listener.hear(message)
          end
        end
    end
end
