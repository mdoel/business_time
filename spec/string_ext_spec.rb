require 'spec_helper'

describe String, "to time" do  

  it "should turn time formated string into float" do
    '14:15'.t_to_f.should == 14.25
    '14:30'.t_to_f.should == 14.5
  end

end