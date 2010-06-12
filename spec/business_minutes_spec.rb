require 'spec_helper'

describe BusinessTime::BusinessMinutes do

  context "with a standard Time object" do

    it "should move to the next 600 seconds (10 min) if we add 600 business seconds" do
      first = Time.parse("04/08/2010 7:35")
      later = 10.business_minutes.after(first)
      expected = Time.parse("04/08/2010 9:00")
      later.should == expected
    end

    it "should take into account a weekend when adding an hour" do
      friday_afternoon = Time.parse("04/09/2010 17:55:00")
      monday_morning = 10.business_minutes.after(friday_afternoon)
      expected = Time.parse("04/12/2010 09:00")
      monday_morning.should == expected
    end
    
    it "should take into account a weekend when adding an hour" do
      friday_afternoon = Time.parse("04/09/2010 17:43:23")
      monday_morning = 10.business_minutes.after(friday_afternoon)
      expected = Time.parse("04/09/2010 17:55")
      monday_morning.should == expected
    end
    
    it "should take into account a weekend when adding an hour" do
      friday_afternoon = Time.parse("04/09/2010 17:59:23")
      monday_morning = 10.business_minutes.after(friday_afternoon)
      expected = Time.parse("04/12/2010 09:00")
      monday_morning.should == expected
    end

    it "should take into account a weekend when adding an hour" do
      first = Time.parse("04/08/2010 14:55:00")
      monday_morning = 10.business_minutes.after(first)
      expected = Time.parse("04/08/2010 15:00")
      monday_morning.should == expected
    end
    # 
    it "should take into account a weekend when adding an hour" do
      first = Time.parse("04/08/2010 04:00:00")
      monday_morning = 10.business_minutes.after(first)
      expected = Time.parse("04/08/2010 09:00")
      monday_morning.should == expected
    end

    it "should take into account a weekend when adding an hour" do
      first = Time.parse("04/08/2010 09:00:00")
      monday_morning = 10.business_minutes.after(first)
      expected = Time.parse("04/08/2010 09:10")
      monday_morning.should == expected
    end

    it "should take into account a weekend when adding an hour" do
      first = Time.parse("04/08/2010 08:55:00")
      monday_morning = 10.business_minutes.after(first)
      expected = Time.parse("04/08/2010 09:00")
      monday_morning.should == expected
    end

    it "shoudl take into account a holiday" do
      BusinessTime::Config.holidays << Date.parse("July 5th, 2010")
      friday_afternoon = Time.parse("July 2nd 2010, 5:55pm")
      tuesday_morning = 10.business_minutes.after(friday_afternoon)
      expected = Time.parse("July 6th 2010, 9:00 am")
      expected.should == tuesday_morning
    end
    
    it "should add hours in the middle of the workday"  do
      monday_morning = Time.parse("April 12th 2010, 9:50 am")
      later = 20.business_minutes.after(monday_morning)
      expected = Time.parse("April 12th 2010, 10:10 am")
      expected.should == later
    end
    
    it "should roll forward to 9 am if asked in the early morning" do
      crack_of_dawn_monday = Time.parse("Mon Apr 26, 04:30:00, 2010")
      monday_morning = Time.parse("Mon Apr 26, 09:00:00, 2010")
      10.business_minutes.after(crack_of_dawn_monday).should == monday_morning
    end
    
    it "should roll forward to the next morning if aftern business hours" do
      monday_evening = Time.parse("Mon Apr 26, 18:00:00, 2010")
      tuesday_morning = Time.parse("Tue Apr 27, 09:00:00, 2010")
      20.business_minutes.after(monday_evening).should == tuesday_morning
    end
    
    it "should consider any time on a weekend as equivalent to monday morning" do
      sunday = Time.parse("Sun Apr 25 12:06:56, 2010")
      monday = Time.parse("Mon Apr 26, 09:00:00, 2010")
      30.business_minutes.after(sunday).should == monday
    end
  end

end
