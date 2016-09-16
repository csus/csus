class Su < ActiveRecord::Base

  #override the naming convention which would otherwise make 'Su' the model and object, and "sus" the table
  self.table_name = "sus"
  
  belongs_to :review
end
