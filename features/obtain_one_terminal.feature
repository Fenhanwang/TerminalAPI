Feature: Show One Terminal
  In order to use terminal API easily
  I need to see one specific terminal instead of a list.
  
  Scenario: Show one Terminal
    Given the system knows about the following terminals:
      | name       | description       | attributes_of_terminals                          |
      | test1      | chrome_terminal   | {"att_name"=>"test1", "att_time"=>"05-12-2015"}  | 
      | test2      | apple_terminal    | {"att_name"=>"test2", "att_time"=>"05-13-2015"}  |
    When the client requests GET /api/terminals/1.json
    Then the single Terminal response should be JSON:
      """
      {
       "id":                      1,
       "name":                    "test1",
       "description":             "chrome_terminal",
       "attributes_of_terminals": {"att_name":"test1", "att_time":"05-12-2015"}
      }
      """