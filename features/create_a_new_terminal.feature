Feature: Create a New Terminal
  In order to use terminal API easily
  I should have ability to create a new terminal from client side.
  
  Scenario: Show one Terminal
    Given the system knows about the following terminals:
      | name       | description       | attributes_of_terminals                          |
      | test1      | chrome_terminal   | {"att_name"=>"test1", "att_time"=>"05-12-2015"}  | 
      | test2      | apple_terminal    | {"att_name"=>"test2", "att_time"=>"05-13-2015"}  |
    And the client want to create a new terminals:
      | name       | description        | attributes_of_terminals                          |
      | test3      | firefox_terminal   | {"att_name"=>"test3", "att_time"=>"05-16-2015"}  |
    When the client requests POST /api/terminals.json
    Then the successful Terminal response should be JSON:
      """
      {
       "id":                      3,
       "name":                    "test3",
       "description":             "firefox_terminal",
       "attributes_of_terminals": {"att_name":"test3", "att_time":"05-16-2015"}
      }
      """