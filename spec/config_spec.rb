require "spec_helper"

describe BusinessTime::Config do

  context "setting the work blocks" do

    before do
    end

    it "keep track of the start of the day" do
      BusinessTime::Config.business_hours.should  ==  {:Monday => ['09:00 - 12:00', '15:00 - 18:00'], :Friday => ['09:00 - 12:00', '15:00 - 18:00']}
      BusinessTime::Config.business_hours         =   {:Monday => ['09:00 - 11:00'],  :Wednesday => ['15:00 - 17:00']}
      BusinessTime::Config.business_hours.should  ==  {:Monday => ['09:00 - 11:00'],  :Wednesday => ['15:00 - 17:00']}
    end

  end

end