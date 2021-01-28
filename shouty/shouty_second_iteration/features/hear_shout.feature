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
            And Sean shouts louder "Free pão de queijo!"
            And Sean shouts louder "Free coffee!"
            Then Lucy hears the following messages:
                |Free pão de queijo!|
                |Free coffee!       |

    Rule: Maximum length of message is 180 characteres
        Scenario: Message is too long
            Given a beautifull person named Sean
            And a beautifull person named Lucy
            #When Sean shouts louder "6326866994988962438559242952737358945545933729952797621815178714697241643915899179731812418288548353326617197194166157288116961786927678387986483997726536222291793551388987526825587"
            When Sean shouts the following message
            """
            Lorem ipsum aenean phasellus sociosqu lobortis quis 
            pretium conubia faucibus per vel sapien tristique, 
            aenean eu hendrerit integer tempor at accumsan elit 
            nam amet lorem. est ut etiam quisque interdum dictum 
            rhoncus eleifend, sociosqu posuere rhoncus magna elementum 
            vehicula lacus, accumsan auctor varius egestas sollicitudin adipiscing.
            """
            Then Lucy should not hear a shout
