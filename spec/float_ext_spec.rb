require 'spec_helper'

describe Float do

  it "should turn a Fixnum into a String that represents time (e.g. 14:30)" do
    18.5.to_time.should == '18:30'
    18.25.to_time.should == '18:15'
    18.22.to_time.should == '18:13'
    18.99999.to_time.should == '19:00'
    23.99999.to_time.should == '24:00'
  end
  
end