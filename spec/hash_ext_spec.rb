require 'spec_helper'

describe Hash do


  context 'includes_date?' do
    # in order to save a time description like Fridays from 9-12 and 15 and Tuesdays at 9-10 and 18-22
    # a hash can be used like this { 'Friday' => [9..12, 15], 'Tuesday' => [9..10, 18..22] }
    # includes_date? is an instance method that you pass a date and it will return true
    # if the date matches the hash's time description
    before(:each) do
      Time.zone = 'Berlin'
      @hash = {:Friday => ['09:00 - 12:00', '05:15'], :Tuesday => ['09:00 - 10:00', '18:00 - 22:00']}
    end


    it "should return an array with the time block borders if the passed date matches" do
      date = Time.zone.parse('05/14/2010 10:00') # Fri, 14 May 2010 10:00:00 UTC +00:00
      @hash.includes_date?(date).class == Array
      @hash.includes_date?(date).first.should == Time.zone.parse('05/14/2010 09:00')
      @hash.includes_date?(date).last.should == Time.zone.parse('05/14/2010 12:00')
    end

    it "should return an array with the time block borders if the passed date matches" do
      date = Time.zone.parse('05/14/2010 5:15') # Fri, 14 May 2010 10:00:00 UTC +00:00
      @hash.includes_date?(date).class == Array
      @hash.includes_date?(date).first.should == Time.zone.parse('05/14/2010 05:15')
      @hash.includes_date?(date).last.should == Time.zone.parse('05/14/2010 05:15')
    end

    it "should return an array with the time block borders if the passed date matches" do
      date = Time.zone.parse('05/03/2010 2:30') # Fri, 14 May 2010 10:00:00 UTC +00:00
      # @hash.includes_date?(date).class == Array
      @hash.includes_date?(date).first.should == false
      @hash.includes_date?(date).last.should == Time.zone.parse('05/04/2010 09:00')
    end

    it "should return false if the passed date does not matche a time range" do
      date = Time.zone.parse('05/14/2010 8:59') # Fri, 14 May 2010 10:00:00 UTC +00:00
      @hash.includes_date?(date).first.should == false
      @hash.includes_date?(date).last.should == Time.zone.parse('05/14/2010 09:00')
    end

    it "should return false if the passed date does not match a specified point in time" do
      date = Time.zone.parse('05/14/2010 5:16') # Fri, 14 May 2010 10:00:00 UTC +00:00
      @hash.includes_date?(date).first.should == false
      @hash.includes_date?(date).last.should == Time.zone.parse('05/14/2010 09:00')
    end
    
    it "should return false if the passed date does not match a specified point in time" do
      date = Time.zone.parse('05/14/2010 5:00') # Fri, 14 May 2010 10:00:00 UTC +00:00
      @hash.includes_date?(date).first.should == false
      @hash.includes_date?(date).last.should == Time.zone.parse('05/14/2010 05:15')
    end
    
    it "should return false if the passed date does not match a specified point in time" do
      date = Time.zone.parse('06/08/2010 11:16') # Tue, 08 July 2010 10:00:00 UTC +00:00
      @hash.includes_date?(date).first.should == false
      @hash.includes_date?(date).last.should == Time.zone.parse('06/08/2010 18:00')
    end
    
    it "should return false if the passed date does not match a specified point in time" do
      date = Time.zone.parse('06/08/2010 03:01') # Tue, 08 July 2010 10:00:00 UTC +00:00
      @hash.includes_date?(date).first.should == false
      @hash.includes_date?(date).last.should == Time.zone.parse('06/08/2010 09:00')
    end
    
    it "should return false if the passed date does not match a specified point in time" do
      date = Time.zone.parse('06/08/2010 23:01') # Tue, 08 July 2010 10:00:00 UTC +00:00
      @hash.includes_date?(date).first.should == false
      @hash.includes_date?(date).last.should == Time.zone.parse('06/11/2010 05:15')
    end
    
    # it "should return true if day is set to daily and range or time matches" do
    #       date = Time.zone.parse('05/03/2010 02:30')
    # 
    #       i = 0
    #       while i < 7 do
    #         borders = @hash.includes_date?(date)
    #         borders.first.should == Time.zone.parse('05/03/2010 02:00') + i * 1.day
    #         borders.last.should == Time.zone.parse('05/03/2010 03:00') + i * 1.day
    #         date = date + 1.day
    #         i = i + 1
    #       end
    #     end

  end

end
