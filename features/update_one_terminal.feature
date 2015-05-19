Feature: Update an existing Terminal
  In order to use terminal API easily
  I should have ability to update an existing terminal from client side.
  
  Scenario: Update one Terminal
    Given the system knows about the following terminals:
      | name       | description       | attributes_of_terminals                          |
      | test1      | chrome_terminal   | {"att_name"=>"test1", "att_time"=>"05-12-2015"}  | 
      | test2      | apple_terminal    | {"att_name"=>"test2", "att_time"=>"05-13-2015"}  |
    And the client want to update the description of terminal named test2:
      | description        |
      | updated_terminal   |
    When the client requests PATCH /api/terminals/2.json
    Then the successful Terminal response should be JSON:
      """
      {
       "id":                      2,
       "name":                    "test2",
       "description":             "updated_terminal",
       "attributes_of_terminals": {"att_name":"test2", "att_time":"05-13-2015"}
      }
      """