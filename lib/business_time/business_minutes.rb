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
      blocks = BusinessTime::Config.business_time_blocks

      while true 
        prev = Time.workday?(date_time) && blocks.include_date?(date_time)

        after = date_time + @minutes
        in_hour = blocks.include_date?(after)
        working = Time.workday?(after) && in_hour

        if working
          date_time = prev ? after : in_hour.first
          break
        else
          date_time += 5.minutes
          next
        end
      end
      date_time
    end
    
  end


end
