require 'httparty'
require 'json'

Given(/^the system knows about the following terminals:$/) do |table|
  # table is a Cucumber::Ast::Table
  # pending 
  # express the regexp above with the code you wish you had
  table.hashes.each do |t|
  	Terminal.create(t)
  end
end

When(/^the client requests GET (.*)$/) do |path|
	puts path 
	@last_response = HTTParty.get('http://localhost:3001' + path)
	puts @last_response.body
  # pending # express the regexp above with the code you wish you had
end

Then(/^the response should be JSON:$/) do |json|
  	Result = JSON.parse(@last_response.body)
  	Result.each do |r|
  		r.delete("created_at")
  		r.delete("updated_at")
  		r.each do |k, v|
  			if k == "attributes_of_terminals"
  				r[k] = eval(v)
  			end
  		end
  	end
  	Result.should == JSON.parse(json)	
  # pending # express the regexp above with the code you wish you had
end