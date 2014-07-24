class Calculator < ActiveRecord::Base
 def +(value)
    self.state=self.state+ value
    self.save!
    self.state
 end

 def -(value)
 	self.state=self.state - value
    self.save!
    self.state
 end
  

 def *(value)
 	self.state=self.state * value
    self.save!
    self.state
 end


 def /(value)
 	self.state=self.state / value
    self.save!
    self.state
 end

 def cancel
 	self.state =0
 	self.save!
 	self.state
end
end