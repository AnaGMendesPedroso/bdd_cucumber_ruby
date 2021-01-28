@second_iteration
Feature: Hear shout

    Shouty allows users to "hear" other users "shouts" as long as they are close enough to each other.

    Rule: Shouts can be heard by other users
        Scenario: Listener hears a message
            Given a beautifull person named Sean
            And a beautifull person named Lucy
            When Sean shouts louder "free bagels at Sean's"
            Then Lucy should hear loud and clear Sean's message

    Rule: Shouts should only be heard if listener is within range
        Scenario: Listener is within range
            Given the range is 100
            And people are located at
                | name     | Sean | Lucy |
                | location | 0    | 50   |
            When Sean shouts 
            Then Lucy should hear a shout

        Scenario: Listener is out of range
            Given the range is 100
            And people are located at
                | name     | Sean | Larry |
                | location | 0    | 150   |
            When Sean shouts 
            Then Larry should not hear a shout
    
        Scenario: Two shouts
            Given a beautifull person named Sean
            And a beautifull person named Lucy
            When Sean shouts louder "Free pão de queijo!"
            And Sean shouts louder "Free coffee!"
            Then Lucy hears the following messages:
                |Free pão de queijo!|
                |Free coffee!       |

