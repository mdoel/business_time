require 'spec_helper'

describe Time do  

  context "" do
    it "should know what a weekend day is" do
      Time.weekday?(Time.zone.parse("April 9, 2010 10:30am")).should be_true
      Time.weekday?(Time.zone.parse("April 10, 2010 10:30am")).should_not be_true
      Time.weekday?(Time.zone.parse("April 11, 2010 10:30am")).should_not be_true
      Time.weekday?(Time.zone.parse("April 12, 2010 10:30am")).should be_true
    end

    it "should know a weekend day is not a workday" do
      Time.workday?(Time.zone.parse("April 9, 2010 10:45 am")).should be_true
      Time.workday?(Time.zone.parse("April 10, 2010 10:45 am")).should_not be_true
      Time.workday?(Time.zone.parse("April 11, 2010 10:45 am")).should_not be_true
      Time.workday?(Time.zone.parse("April 12, 2010 10:45 am")).should be_true
    end

    it "should know a holiday is not a workday" do
      BusinessTime::Config.reset

      BusinessTime::Config.holidays << Date.parse("July 4, 2010")
      BusinessTime::Config.holidays << Date.parse("July 5, 2010")

      Time.workday?(Time.zone.parse("July 4th, 2010 1:15 pm")).should_not be_true
      Time.workday?(Time.zone.parse("July 5th, 2010 2:37 pm")).should_not be_true
    end


    it "should know the beginning of the day for an instance" do
      first = Time.zone.parse("August 17th, 2010, 11:50 am")
      expecting = Time.zone.parse("August 17th, 2010, 9:00 am")
      expecting.should == Time.beginning_of_workday(first)
    end

    it "should know the end of the day for an instance" do
      first = Time.zone.parse("August 17th, 2010, 11:50 am")
      expecting = Time.zone.parse("August 17th, 2010, 5:00 pm")
      expecting.should == Time.end_of_workday(first)
    end

  end


  context "With Eastern Standard Time" do
    before do
      Time.zone = 'Berlin'
    end

    it "should know what a weekend day is" do
      Time.weekday?(Time.zone.parse("April 9,   2010 10:30am")).should be_true
      Time.weekday?(Time.zone.parse("April 10,  2010 10:30am")).should_not be_true
      Time.weekday?(Time.zone.parse("April 11,  2010 10:30am")).should_not be_true
      Time.weekday?(Time.zone.parse("April 12,  2010 10:30am")).should be_true
    end

    it "should know a weekend day is not a workday" do
      Time.workday?(Time.zone.parse("April 9,   2010 10:45 am")).should be_true
      Time.workday?(Time.zone.parse("April 10,  2010 10:45 am")).should_not be_true
      Time.workday?(Time.zone.parse("April 11,  2010 10:45 am")).should_not be_true
      Time.workday?(Time.zone.parse("April 12,  2010 10:45 am")).should be_true
    end

    it "should know a holiday is not a workday" do
      BusinessTime::Config.reset

      BusinessTime::Config.holidays << Date.parse("July 4, 2010")
      BusinessTime::Config.holidays << Date.parse("July 5, 2010")

      Time.workday?(Time.zone.parse("July 4th, 2010 1:15 pm")).should_not be_true
      Time.workday?(Time.zone.parse("July 5th, 2010 2:37 pm")).should_not be_true
    end


    it "should know the beginning of the day for an instance" do
      first = Time.zone.parse("August 17th, 2010, 11:50 am")
      expecting = Time.zone.parse("August 17th, 2010, 9:00 am")
      expecting.should == Time.beginning_of_workday(first)
    end

    it "know the end of the day for an instance" do
      first = Time.zone.parse("August 17th, 2010, 11:50 am")
      expecting = Time.zone.parse("August 17th, 2010, 5:00 pm")
      expecting.should == Time.end_of_workday(first)
    end
  end


  context "With UTC Timezone" do
    before do
      Time.zone = 'UTC'
    end

    it "should know what a weekend day is" do
      Time.weekday?(Time.zone.parse("April 9, 2010 10:30am")).should be_true
      Time.weekday?(Time.zone.parse("April 10, 2010 10:30am")).should_not be_true
      Time.weekday?(Time.zone.parse("April 11, 2010 10:30am")).should_not be_true
      Time.weekday?(Time.zone.parse("April 12, 2010 10:30am")).should be_true
    end

    it "should know a weekend day is not a workday" do
      Time.workday?(Time.zone.parse("April 9, 2010 10:45 am")).should be_true
      Time.workday?(Time.zone.parse("April 10, 2010 10:45 am")).should_not be_true
      Time.workday?(Time.zone.parse("April 11, 2010 10:45 am")).should_not be_true
      Time.workday?(Time.zone.parse("April 12, 2010 10:45 am")).should be_true
    end

    it "should know a holiday is not a workday" do
      BusinessTime::Config.reset

      BusinessTime::Config.holidays << Date.parse("July 4, 2010")
      BusinessTime::Config.holidays << Date.parse("July 5, 2010")

      Time.workday?(Time.zone.parse("July 4th, 2010 1:15 pm")).should_not be_true
      Time.workday?(Time.zone.parse("July 5th, 2010 2:37 pm")).should_not be_true
    end


    it "should know the beginning of the day for an instance" do
      first = Time.zone.parse("August 17th, 2010, 11:50 am")
      expecting = Time.zone.parse("August 17th, 2010, 9:00 am")
      expecting.should == Time.beginning_of_workday(first)
    end

    it "know the end of the day for an instance" do
      first = Time.zone.parse("August 17th, 2010, 11:50 am")
      expecting = Time.zone.parse("August 17th, 2010, 5:00 pm")
      expecting.should == Time.end_of_workday(first)
    end
  end


  context "rounding datetimes" do
    before do
      Time.zone = "Berlin"
    end
    
    it "should return a date with modulo 5 == 0 minutes" do
      datetime = Time.zone.parse('04/12/2010 11:34:27')
      datetime.ceil(5).should == Time.zone.parse('04/12/2010 11:35:00')
    end
    
    it "should return a date with modulo 5 == 0 minutes" do
      datetime = Time.zone.parse('04/12/2010 11:36:27')
      datetime.ceil(5).should == Time.zone.parse('04/12/2010 11:40:00')
    end

    it "should return a date with modulo 5 == 0 minutes" do
      datetime = Time.zone.parse('04/12/2010 13:58:47')
      datetime.ceil(5).should == Time.zone.parse('04/12/2010 14:00:00')
    end
    
  end
  
  
  

end
