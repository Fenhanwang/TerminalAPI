class Terminal < ActiveRecord::Base
	serialize :attributes_of_terminals, JSON
end
