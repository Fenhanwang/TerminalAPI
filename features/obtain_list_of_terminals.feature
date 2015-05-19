Feature: Terminal list
  In order to use terminal API easily
  I need to see some different terminals.
  
  Scenario: List terminals
    Given the system knows about the following terminals:
      | name       | description       | attributes_of_terminals                          |
      | test1      | chrome_terminal   | {"att_name"=>"test1", "att_time"=>"05-12-2015"}  | 
      | test2      | apple_terminal    | {"att_name"=>"test2", "att_time"=>"05-13-2015"}  |
    When the client requests GET /api/terminals.json
    Then the response should be JSON:
      """
      [
        {
         "id":                      1,
         "name":                    "test1",
         "description":             "chrome_terminal",
         "attributes_of_terminals": {"att_name":"test1", "att_time":"05-12-2015"}
        },
        {
         "id":                       2,
         "name":                     "test2",
         "description":              "apple_terminal",
         "attributes_of_terminals": {"att_name":"test2", "att_time":"05-13-2015"}
        }
      ]
      """