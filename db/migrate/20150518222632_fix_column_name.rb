class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :terminals, :attributes, :attributes_of_terminals
  end
end
