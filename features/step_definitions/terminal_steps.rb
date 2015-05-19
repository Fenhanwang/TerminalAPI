require 'httparty'
require 'json'
require "net/http"

Given(/^the system knows about the following terminals:$/) do |table|
  table.hashes.each do |t|
  	Terminal.create(t)
  end
end

Given(/^the client want to create a new terminals:$/) do |table|
  @new_terminal = table.hashes
  # puts @new_terminal[0]["attributes_of_terminals"]
end

Given(/^the client want to update the description of terminal named test(\d+):$/) do |arg1, table|
  @update_terminal = table.hashes
  # puts @update_terminal
end

Given(/^the client want to remove the terminal named (.*)$/) do |name|
  # pending # express the regexp above with the code you wish you had
  puts name
end

When(/^the client requests DELETE (.*)$/) do |path|
  # pending # express the regexp above with the code you wish you had
  uri = URI('http://localhost:3000' + path)
  req = Net::HTTP::Delete.new(uri)
  # req.set_form_data({"terminal[_method]" => "patch",
  #                    "terminal[description]" => @update_terminal[0]["description"]
  #                   })
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    @successful_response = http.request(req)
  end

  case res
  when Net::HTTPSuccess, Net::HTTPRedirection
    puts "Send DELETE successfully"
    # puts @successful_response.body
  else
    res.value
  end
end


When(/^the client requests PATCH (.*)$/) do |path|
  # pending # express the regexp above with the code you wish you had
  uri = URI('http://localhost:3000' + path)
  req = Net::HTTP::Patch.new(uri)
  req.set_form_data({"terminal[_method]" => "patch",
                     "terminal[description]" => @update_terminal[0]["description"]
                    })
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    @successful_response = http.request(req)
  end

  case res
  when Net::HTTPSuccess, Net::HTTPRedirection
    puts "Send PATCH successfully"
    # puts @successful_response.body
  else
    res.value
  end
end


When(/^the client requests POST (.*)$/) do |path|
  uri = URI('http://localhost:3000' + path)
  req = Net::HTTP::Post.new(uri)
  req.set_form_data({"terminal[name]" => @new_terminal[0]["name"],
                      "terminal[description]" => @new_terminal[0]["description"],
                      "terminal[attributes_of_terminals]" => @new_terminal[0]["attributes_of_terminals"]
                    })
  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    @successful_response = http.request(req)
  end

  case res
  when Net::HTTPSuccess, Net::HTTPRedirection
    puts "Send POST successfully"
    # puts @successful_response.body
  else
    res.value
  end
  # pending
end

When(/^the client requests GET (.*)$/) do |path|
	@last_response = HTTParty.get('http://localhost:3000' + path)
end

Then(/^the response should be JSON:$/) do |json|
	@Result = JSON.parse(@last_response.body)
	@Result.each do |r|
		r.delete("created_at")
		r.delete("updated_at")
		r.each do |k, v|
			if k == "attributes_of_terminals"
				r[k] = eval(v)
			end
		end
	end
	@Result.should == JSON.parse(json)	
end


Then(/^the single Terminal response should be JSON:$/) do |json|
  @Result = JSON.parse(@last_response.body)
  @Result.delete("created_at")
  @Result.delete("updated_at")
  @Result.each do |k, v|
    if k == "attributes_of_terminals"
      @Result[k] = eval(v)
    end
  end
  @Result.should == JSON.parse(json)
end

Then(/^the successful Terminal response should be JSON:$/) do |json|
  @Result = JSON.parse(@successful_response.body)
  @Result.delete("created_at")
  @Result.delete("updated_at")
  @Result.each do |k, v|
    if k == "attributes_of_terminals"
      @Result[k] = eval(v)
    end
  end
  @Result.should == JSON.parse(json)
  # pending # express the regexp above with the code you wish you had
end

Then(/^the database should have only (\d+) Terminal$/) do |number|
  size_of_database = Terminal.all.size
  size_of_database.should == 1
end

Then(/^the id of that Terminal is (\d+)$/) do |arg1|
  Terminal.all[0][:id].should == 1
end