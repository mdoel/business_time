module BusinessTime


  class BusinessMinutes

    def initialize(int)
      @minutes = int.minutes
    end

    def from_now
      Time.zone ?  after(Time.zone.now) : after(Time.now)
    end

    def after(date_time)
      date_time = date_time.ceil(5)
      # Step through the hours, skipping over non-business hours
      blocks = BusinessTime::Config.business_hours

      after_time = date_time + @minutes
      after_block = blocks.include_date?(after_time + @minutes)
      
      from = blocks.include_date?(date_time).first
      after = after_block.first
      
      if ((from && !after) || !(from || after))
        roll_to_workday(after_block.last)

      elsif !from && after
        roll_to_workday(after_block.first)

      else # from && after
        roll_to_workday(after_time)

      end
    end
    
    def roll_to_workday(next_block)
      blocks = BusinessTime::Config.business_hours
      
      while !Time.workday?(next_block)
        next_day = blocks.include_date?(next_block.beginning_of_day + 1.day)
        next_day.first ? next_block = next_day.first : next_block = next_day.last  
      end
      next_block
    end
    
  end


end
