Feature: Hear shout
    Shouty allows users to "hear" other users "shouts" as long as they are close enough to each other.

    To do:
        - only shout to people within a certain distance

    Background: Persons
        Given a person named Lucy
        And a person named Sean

    Rule: Shouts can be heard by other users
        Scenario: Listener hears a message
            When Sean shouts "free bagels at Sean's"
            Then Lucy should hear Sean's message

        Scenario: Listener hears a different mesage
            When Sean shouts "Free coffee!"
            Then Lucy should hear Sean's message

        Scenario: Listener hears two differents messages
            When Sean shouts "Free coffee!" and "And tomatos!"
            Then Lucy should hear Sean's messages

    Rule: Shouts should only be heard if listener is within range

        Scenario: Listener is within range

        Scenario: Listener is out of range