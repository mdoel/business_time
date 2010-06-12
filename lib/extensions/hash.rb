class Hash
  # in order to save a time description like Fridays from 9-12 and 15 and Tuesdays at 9-10 and 18-22
  # a hash can be used like this { 'Friday' => [9..12, 15], 'Tuesday' => [9..10, 18..22] }
  # includes_date? is an instance method that you pass a date and it will return true
  # if the date matches the hash's time description

  def include_date?(date)
    # check if the hash has a day entry for the date's day

    # if date is a hash or string
    date = Time.zone.parse(date.to_s)

    day = (times = self[date.strftime('%A').to_sym]) ? self.match?(date, times) : false
    daily = (times = self[:daily]) ? self.match?(date, times) : false

    day || daily
  end

  def match?(date, times)
    hour = date.strftime('%H').to_i
    minutes = (date.strftime('%M').to_i)/60.0
    ttime = hour + minutes # termin time 
    match = false

    times.each do |time|
      if time.class == Range
        if time.include?(ttime)
          min = Time.zone.parse(date.strftime("%m/%d/%Y #{time.min.to_time}"))
          max = Time.zone.parse(date.strftime("%m/%d/%Y #{time.max.to_time}"))
          match = [min,max]
          break 
        end
      else   
        if time == ttime
          minmax = Time.zone.parse(date.strftime("%m/%d/%Y #{time.to_time}"))
          match = [minmax, minmax]
          break 
        end
      end
    end
    match
  end

  alias_method :includes_date?, :include_date?
end