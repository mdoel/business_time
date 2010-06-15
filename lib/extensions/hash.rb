class Hash
  # in order to save a time description like Fridays from 9-12 and 15 and Tuesdays at 9-10 and 18-22
  # a hash can be used like this { 'Friday' => [9..12, 15], 'Tuesday' => [9..10, 18..22] }
  # includes_date? is an instance method that you pass a date and it will return true
  # if the date matches the hash's time description




  def include_date?(date)
    # check if the hash has a day entry for the date's day
    date = Time.zone.parse(date.to_s); i = 0
    while i < 7
      blocks = self[date.strftime('%A').to_sym]

      if blocks # e.g. [9..12, 15..18, 19.25]
        if i == 0 && result = self.match?(date, blocks)
          return result
        else
          next_time = blocks.map do |b|
            begin
              min = date.strftime("%m/%d/%Y #{b.min.to_time}")
              Time.zone.parse(min)
            rescue
              min = date.strftime("%m/%d/%Y #{b.to_time}")
              Time.zone.parse(min)
            end
          end.select {|b| b > date}.sort.first

          return [false, next_time] if next_time
        end
      end # if blocks 
      date = date.beginning_of_day + 1.day
      i += 1
    end #while
  end



  # def include_date?(date)
  #   # check if the hash has a day entry for the date's day
  # 
  #   # if date is a hash or string
  #   date = Time.zone.parse(date.to_s)
  # 
  #   day = (times = self[date.strftime('%A').to_sym]) ? self.match?(date, times) : false
  #   daily = (times = self[:daily]) ? self.match?(date, times) : false
  # 
  #   day || daily
  # end





  def match?(date, blocks)
    hour = date.strftime('%H').to_i
    minutes = (date.strftime('%M').to_i)/60.0
    ttime = hour + minutes # termin time 
    match = false

    blocks.each do |time|
      if time.class == Range
        if time.include?(ttime)
          match = [time.min, time.max].map do |t|
            border = date.strftime("%m/%d/%Y #{t.send :to_time}")
            Time.zone.parse(border)  
          end
          break 
        end
      else   
        if time == ttime
          border = date.strftime("%m/%d/%Y #{time.to_time}")
          minmax = Time.zone.parse(border)
          match = [minmax, minmax]
          break 
        end
      end
    end
    match
  end

  alias_method :includes_date?, :include_date?
end