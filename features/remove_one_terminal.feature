Feature: Remove an existing Terminal
  In order to use terminal API easily
  I should have ability to remove an existing terminal from client side.
  
  Scenario: Remove one Terminal
    Given the system knows about the following terminals:
      | name       | description       | attributes_of_terminals                          |
      | test1      | chrome_terminal   | {"att_name"=>"test1", "att_time"=>"05-12-2015"}  | 
      | test2      | apple_terminal    | {"att_name"=>"test2", "att_time"=>"05-13-2015"}  |
    And the client want to remove the terminal named test2
    When the client requests DELETE /api/terminals/2.json
    Then the database should have only 1 Terminal
    And the id of that Terminal is 1