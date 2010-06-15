require "spec_helper"

describe BusinessTime::Config do

  context "setting the work blocks" do

    before do
    end

    it "keep track of the start of the day" do
      BusinessTime::Config.business_time_blocks.should  ==  {:Monday => [9..12, 15..18], :Friday => [9..12, 15..18]}
      BusinessTime::Config.business_time_blocks         =   {:Monday => [9..11],  :Wednesday => [15..17]}
      BusinessTime::Config.business_time_blocks.should  ==  {:Monday => [9..11],  :Wednesday => [15..17]}
    end

  end

end