require 'spec_helper'

describe Fixnum do
    
  it "should respond to business_hours by returning an instance of BusinessHours" do
    1.respond_to?(:business_hour).should be_true
    1.respond_to?(:business_hours).should be_true
    1.business_hour.instance_of?(BusinessTime::BusinessHours).should be_true
  end
  
  it "should respond to business_days by returning an instance of BusinessDays" do
    1.respond_to?(:business_day).should be_true
    1.respond_to?(:business_days).should be_true
    1.business_day.instance_of?(BusinessTime::BusinessDays).should be_true
  end

end