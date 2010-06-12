require 'spec_helper'

describe Date do

  context "deal with weekends and holidays" do  
    
    it "should know what a weekend day is"  do
      Date.parse("April 9, 2010").weekday?.should be_true
      Date.parse("April 10, 2010").weekday?.should_not be_true
      Date.parse("April 11, 2010").weekday?.should_not be_true
      Date.parse("April 12, 2010").weekday?.should be_true
    end

    it "should know a weekend day is not a workday"  do
      Date.parse("April 9, 2010").workday?.should be_true
      Date.parse("April 10, 2010").workday?.should_not be_true
      Date.parse("April 11, 2010").workday?.should_not be_true
      Date.parse("April 12, 2010").workday?.should be_true
    end

    it "should know a holiday is not a workday" do
      july_4 = Date.parse("July 4, 2010")
      july_5 = Date.parse("July 5, 2010")

      july_4.workday?.should_not be_true
      july_5.workday?.should be_true

      BusinessTime::Config.holidays << july_4
      BusinessTime::Config.holidays << july_5

      july_4.workday?.should_not be_true
      july_5.workday?.should_not be_true
    end
    
  end
end